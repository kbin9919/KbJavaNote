import styled from "styled-components";
const NaviMenuLayoutDiv = styled.div`
    width: 20%;
    height: 80%;
    background-color: gray;
    display: flex;
    justify-content: center;
    align-items: center;
    &:hover{
        background-color: black;
        color: white;
    }
`;
const NaviMenu = ( {str, url} ) => {
    return <>
        <NaviMenuLayoutDiv>
            <a href={url}>{str}</a>
        </NaviMenuLayoutDiv>
    </>
}
export default NaviMenu;
