import { useState } from "react";

function Counter() {

    // const result = useState(0);
    // const value = result[0];
    // const setValue = result[1];
    const [value, setValue] = useState(0);

    const f01 = function () {
        setValue(value +1);
    }

    return (
        <>
            <h1>카운터</h1>
            <h1 id="target">{value}</h1>
            <button onClick={f01}>플러스</button>
        </>
    );
}

export default Counter;