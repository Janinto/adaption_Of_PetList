스토리보드에서 테이블 뷰를 만들고 메모 추가 버튼을 눌렀을 시 보여지는 디테일 뷰 컨트롤러와 xib 파일을 만들었습니다.
뷰 컨트롤러에서 헤더를 만들고 local DB를 생성해 입력한 필드 값을 저장하고 테이블 뷰에 정보를 업데이트, 갱신합니다.
저장한 값들은 우선순위도에 따라서 색이 부여되며 갈색은 천천히 해도 되는 정도, 노란색은 중간, 빨간색은 급하게 해야하는 일을 의미합니다.
혹시나 값을 잘못 적었을 때는 다시 클릭해 값을 수정하여 수정버튼을 누르면 수정된 값이 갱신되어 있는 테이블 뷰를 확인할 수 있습니다.
마지막으로 '삭제' 버튼은 처음에 입력한 값을 포함하여 그 이후에 수정한 값도 삭제할 수 있는 버튼입니다.
삭제 버튼을 눌러서 local storage에 있는 값을 삭제합니다.
