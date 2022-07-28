package edu.kh.podo.board.itemBoard.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.podo.board.itemBoard.model.dao.ItemBoardDAO;
import edu.kh.podo.board.itemBoard.model.vo.BoardImage;
import edu.kh.podo.board.itemBoard.model.vo.Coordinate;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.common.Util;
import edu.kh.podo.member.model.vo.Member;

@Service
public class ItemBoardServiceImpl implements ItemBoardService {

	@Autowired
	private ItemBoardDAO dao;
	
	// 메인화면 상품 4개만 조회 Service (ajax)
	@Override
	public List<ItemBoard> selectItemFour(int boardNo) {
		
		// 해당 보드 넘버로부터 뒤의 4개의게시물 가져오기
		List<ItemBoard> sellList = dao.selectitemFor(boardNo);
		
		
		// 해당 보드 넘버로부터 뒤의 5개의 게시물 중 이미지 레벨 0번 이미지 조회
		List<BoardImage> sellListImg = dao.selectItemsFor(boardNo);
		
		for(ItemBoard sell : sellList) {
			
			for(BoardImage img : sellListImg) {
				if(img.getBoardNo()== sell.getBoardNo()) {
					sell.setImg(img);
				}
			}
			
		}
		return sellList;
	}

	@Override
	public int insertBoard(ItemBoard item, List<MultipartFile> imageList, String webPath, String folderPath, Coordinate crdnt) throws IOException {

		item.setBoardTitle(Util.XSSHandling(item.getBoardTitle()));
		item.setBoardContent(Util.XSSHandling(item.getBoardContent()));
		
		item.setCoordinate(crdnt);
		
//		item.setBoardContent(Util.newLineHandling(item.getBoardContent()));
		
		int boardNo = dao.insertBoard(item);		

		if (boardNo > 0) {
			List<BoardImage> boardImageList = new ArrayList<BoardImage>();
			List<String> reNameList = new ArrayList<String>();

			for (int i = 0; i < imageList.size(); i++) {

				if (imageList.get(i).getSize() > 0) { // i번째 요소에 업로드된 이미지가 있을 경우

					String reName = Util.fileRename(imageList.get(i).getOriginalFilename());
					reNameList.add(reName);

					BoardImage img = new BoardImage();
					img.setBoardNo(boardNo);
					img.setImageLevel(i);
					img.setImageOriginal(imageList.get(i).getOriginalFilename());
					img.setImageReName(webPath + reName);

					boardImageList.add(img);

				}
			}
			// 분류 작업 종료 후 boardIamgeList가 비어있지 않은 경우 == 파일이 업로드가 된 경우
			if (!boardImageList.isEmpty()) {

				int result = dao.insertBoardImageList(boardImageList);

				// result == 삽입 성공한 행의 갯수, 단지 0,1이 아니다.

				if (result == boardImageList.size()) { // 삽입된 행의 갯수과 업로드 이미지 수가 같을 경우

					// 이제야 서버에 이미지를 저장한다.

					for (int i = 0; i < boardImageList.size(); i++) {

						int index = boardImageList.get(i).getImageLevel();

							imageList.get(index).transferTo(new File(folderPath + reNameList.get(i)));
						
						// imageList에는 multipartFile로 된 실제로 삽입된 이미지가 존재한다.
						// 그것을 파일로 변화해서 업로드를 하는 것이다.
						// 1. 우선 이미지 리스트에 파일을 저장한다. 파일이 비어있더라도 받아온다.
						// 2. 이것을 파일이 존재하는 것만 boardImageList에 저장한다. 이 때, 경로 webPath가 붙어서 이동한다.
						// 3. reNameList는 바뀐 이름을 저장한다.
					}
				}else{

				}
			}
		}

		return boardNo;

	}


	// 판매글 상세조회 Service 구현
	@Override
	public Map<String, Object> itemDetail(int boardNo) {

		Map<String, Object> map = new HashMap<String, Object>();

		// 조회수 증가
		dao.updateReadCount(boardNo);
		
		// 상품 상세조회
		List<ItemBoard> itemList = dao.selectItem(boardNo);
		int memberNo = dao.selectMemberNo(boardNo);

		map.put("itemList", itemList);
		map.put("memberNo", memberNo);

		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("boardNo", boardNo);
		daoMap.put("memberNo", memberNo);
		
		List<BoardImage> boardImageList = dao.selectBoardImageList(boardNo);
		map.put("boardImageList", boardImageList);

		// 판매자 다른 상품 조회
		List<ItemBoard> sellList = dao.selectOtherItems(daoMap);
		
		// 판매자 다른 상품의 이미지 레벨 0번 이미지 조회
		List<BoardImage> sellListImg = dao.selectOtherItemsImg(daoMap);
		
		for(ItemBoard sell : sellList) {

			for(BoardImage img : sellListImg) {
				if(img.getBoardNo()== sell.getBoardNo()) {
					sell.setImg(img);
				}
			}
			
		}
		map.put("sellList", sellList);
		
		// 중분류 번호 조회
		int mCNo = dao.selectMCNo(boardNo);
		
		// 중분류에 해당하는 다른 추천 상품 조회
		List<ItemBoard> otherItems = dao.selectOtherItems(mCNo);
		map.put("otherItems", otherItems);

		// 회원 정보 조회
		List<Member> sellMember = dao.sellMemberInfo(memberNo);
		map.put("sellMember", sellMember);

		return map;
	}

	// 찜 등록 Service 구현
	@Override
	public int addFav(Map<String, Object> map) {
		return dao.addFav(map);
	}

	// 찜 개수 +1 Service 구현
	@Override
	public int addCountAdd(Map<String, Object> map) {
		return dao.addCountAdd(map);
	}
	// 게시글 수정 Service 구현
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateBoard(ItemBoard item, List<MultipartFile> imageList, String webPath, String folderPath, String deleteList) throws IOException {
		
		item.setBoardTitle(Util.XSSHandling(item.getBoardTitle()));
		item.setBoardContent(Util.XSSHandling(item.getBoardContent()));
		item.setBoardContent(Util.newLineHandling(item.getBoardContent()));
		
		int result = dao.updateBoard(item);
		
		if (result > 0) {
			
			List<BoardImage> boardImageList = new ArrayList<BoardImage>();
			List<String> reNameList = new ArrayList<String>();
			 
			for(int i=0 ; i<imageList.size() ; i++) {
			   
			    if( imageList.get(i).getSize() > 0  ) { 
			   
				    String reName = Util.fileRename( imageList.get(i).getOriginalFilename()  );
				    reNameList.add(reName);
				    
				    BoardImage img = new BoardImage();
				    img.setBoardNo(item.getBoardNo()); // 게시글 번호
				    img.setImageLevel(i); // 이미지 순서(파일 레벨)
				    img.setImageOriginal( imageList.get(i).getOriginalFilename() ); // 원본 파일명
				    img.setImageReName( webPath + reName ); // 웹 접근 경로 + 변경된 파일명
				    
				    boardImageList.add(img);
	            }
	        } 
			
			// 4) deleteList를 이용해서 삭제된 이미지 delete
			if (!deleteList.equals("")) {
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("boardNo", item.getBoardNo());
				map.put("deleteList", deleteList);
				
				result = dao.deleteBoardImage(map);
			}
			
			if (result > 0) {
				
				// 5) boardImageList를 순차접근하면서 하나씩 업데이트
				for (BoardImage img : boardImageList) {
					
					result = dao.updateBoardImage(img); // 변경명, 원본명, 게시글 번호, 레벨
					// 결과 1 -> 수정 O -> 기존 이미지가 있었다.
					
					// 결과 0 -> 수정 X -> 기존 이미지가 없었다.
					// -> insert 작업 수행
					
					// 6) update를 실패하면 insert
					if (result == 0) {
						result = dao.insertBoardImage(img);
						// -> 값을 하나씩 대입해서 삽입하는 경우 결과가 0이 나올 수 없다!
						//    단, 예외(제약조건 위배, SQL 문법 오류 등)은 발생할 수 있다.
					}
					
				}
				
				// 7) 업로드 된 이미지가 있다면 서버에 저장
				if (!boardImageList.isEmpty() && result != 0) {
					for (int i = 0; i < boardImageList.size(); i++) {
						int index = boardImageList.get(i).getImageLevel();
						imageList.get(index).transferTo(new File(folderPath + "/" + reNameList.get(i)));
					}
				}
				
			}
		
		}
		
		return result;
	}

	// 수정용 상세조회
	@Override
	public ItemBoard selectBoardDetail(int boardNo) {
		return dao.selectBoardDetail(boardNo);
	}

	@Override
	public List<BoardImage> selectBoardImageList(int boardNo) {
		return dao.selectBoardImageList(boardNo);
	}

	// 조회수 상품 조회 Service
	@Override
	public List<ItemBoard> selectReadCountList() {
		
		List<ItemBoard> readCountList = dao.selectReadCountList();
		
		// 판매자 다른 상품의 이미지 레벨 0번 이미지 조회
		List<BoardImage> sellListImg = dao.selectItemsImg();
		
		for(ItemBoard sell : readCountList) {

			for(BoardImage img : sellListImg) {
				if(img.getBoardNo()== sell.getBoardNo()) {
					sell.setImg(img);
				}
			}
			
		}
		return readCountList;
	}
	
	// 거리별 상품 조회
	@Override
	public List<ItemBoard> selectDistList(Map<String, Object> distMap) {
		
		List<ItemBoard> distList = dao.selectDistList(distMap);
		List<BoardImage> sellListImg = dao.selectItemsImg();
		
		for(ItemBoard sell : distList) {

			for(BoardImage img : sellListImg) {
				if(img.getBoardNo()== sell.getBoardNo()) {
					sell.setImg(img);
				}
			}
			
		}
		
		return distList;
	}

	
	// 포도순 상품 조회
	@Override
	public List<ItemBoard> selectPodoList() {
		List<ItemBoard> podoList = dao.selectPodoList();
		List<BoardImage> sellListImg = dao.selectItemsImg();
		
		for(ItemBoard sell : podoList) {

			for(BoardImage img : sellListImg) {
				if(img.getBoardNo()== sell.getBoardNo()) {
					sell.setImg(img);
				}
			}
			
		}
		
		return podoList;
	}

	// 무로배송 상품 조회
	@Override
	public List<ItemBoard> selectFreeShopList() {
		List<ItemBoard> freeShopList = dao.selectFreeShopList();
		
		List<BoardImage> sellListImg = dao.selectItemsImg();
		
		for(ItemBoard sell : freeShopList) {

			for(BoardImage img : sellListImg) {
				if(img.getBoardNo()== sell.getBoardNo()) {
					sell.setImg(img);
				}
			}
			
		}
		
		return freeShopList;
	}

	// 미개봉 상품 조회
	@Override
	public List<ItemBoard> selectUnOpenList() {
		List<ItemBoard> unOpenList = dao.selectUnOpenList();
		List<BoardImage> sellListImg = dao.selectItemsImg();
		
		for(ItemBoard sell : unOpenList) {

			for(BoardImage img : sellListImg) {
				if(img.getBoardNo()== sell.getBoardNo()) {
					sell.setImg(img);
				}
			}
			
		}
		
		return unOpenList;
	}
	
	// 상품명 검색 구현
	@Override
	public List<ItemBoard> searchBoard(String query) {

		List<ItemBoard> searchList = dao.searchBoard(query);

		List<BoardImage> sellListImg = dao.selectItemsImg();
		
		for(ItemBoard sell : searchList) {

			for(BoardImage img : sellListImg) {
				if(img.getBoardNo()== sell.getBoardNo()) {
					sell.setImg(img);
				}
			}
			
		}
		
		return searchList;
	}
	

}
