import styled from "styled-components";
import Header from "./Header";
import Navi from "./Navi";
const TopLayoutDiv = styled.div`
    display: grid;
    width: 100%;
    height: 100%;

    grid-template-columns: 1fr;
    grid-template-rows: 2fr 1fr;
`;
function Top() {
    return (<>
        <TopLayoutDiv>
            <Header />
            <Navi/>
        </TopLayoutDiv>
    </>)
}
export default Top;