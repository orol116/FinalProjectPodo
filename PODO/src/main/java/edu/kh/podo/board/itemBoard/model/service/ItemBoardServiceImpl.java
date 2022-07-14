package edu.kh.podo.board.itemBoard.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.podo.board.itemBoard.model.dao.ItemBoardDAO;
import edu.kh.podo.board.itemBoard.model.vo.BoardImage;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.common.Util;
import edu.kh.podo.member.model.vo.Member;

@Service
public class ItemBoardServiceImpl implements ItemBoardService {

	@Autowired
	private ItemBoardDAO dao;

	// 메인화면 상품 조회 Service
	@Override
	public List<ItemBoard> selectItemList() {
		return dao.selectitemList();
	}

	@Override
	public int insertBoard(ItemBoard item, List<MultipartFile> imageList, String webPath, String folderPath) {

		item.setBoardTitle(Util.XSSHandling(item.getBoardTitle()));
		item.setBoardContent(Util.XSSHandling(item.getBoardContent()));

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

						try {
							imageList.get(index).transferTo(new File(folderPath + reNameList.get(i)));
						} catch (IOException e) {
							e.printStackTrace();
						}
						;
						// imageList에는 multipartFile로 된 실제로 삽입된 이미지가 존재한다.
						// 그것을 파일로 변화해서 업로드를 하는 것이다.
						// 1. 우선 이미지 리스트에 파일을 저장한다. 파일이 비어있더라도 받아온다.
						// 2. 이것을 파일이 존재하는 것만 boardImageList에 저장한다. 이 때, 경로 webPath가 붙어서 이동한다.
						// 3. reNameList는 바뀐 이름을 저장한다.
					}

				} else {

				}
			}
		}

		return boardNo;

	}

	// 상품명 검색 구현
	@Override
	public List<ItemBoard> searchBoard(String query) {

		List<ItemBoard> searchList = dao.searchBoard(query);

		return searchList;
	}

	// 판매글 상세조회 Service 구현
	@Override
	public Map<String, Object> itemDetail(int boardNo) {

		Map<String, Object> map = new HashMap<String, Object>();

		// 상품 상세조회
		List<ItemBoard> itemList = dao.selectItem(boardNo);
		int memberNo = dao.selectMemberNo(boardNo);

		map.put("itemList", itemList);
		map.put("memberNo", memberNo);

		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("boardNo", boardNo);
		daoMap.put("memberNo", memberNo);

		// 판매자 다른 상품 조회
		List<ItemBoard> sellList = dao.selectOtherItems(daoMap);
		map.put("sellList", sellList);

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

}
