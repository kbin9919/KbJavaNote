import styled from "styled-components";
import NaviMenu from "./NaviMenu";
const NaviLayoutDiv = styled.div`
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: space-evenly;
    align-items: center;
`;
const Navi = () => {
    return <>
        <NaviLayoutDiv>
            <NaviMenu str="게시글" url="/app/board/list"></NaviMenu>
            <NaviMenu str="공지사항" url="/app/notice/list"></NaviMenu>
            <NaviMenu str="갤러리" url="/app/gallery/list"></NaviMenu>
            <NaviMenu str="Q&A" url="/app/qna/list"></NaviMenu>
        </NaviLayoutDiv>
    </>
};
export default Navi;