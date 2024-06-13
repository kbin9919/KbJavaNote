import styled from "styled-components"
import Main from "./Main";
import Aside from "./Aside";
const MidLayoutDiv = styled.div`
    width: 100%;
    height: 100%;
    display: grid;
    grid-template-rows: 1fr;
    grid-template-columns: 1fr 6fr 1fr;
    place-content: center center;
`;
export default function Mid(){
    return(<>
        <MidLayoutDiv>
            <Aside str="광고 1" />
            <Main />
            <Aside str="광고 2" />
        </MidLayoutDiv>
    </>)
}