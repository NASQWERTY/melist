<div id="temp">
    <ul>
        <g:each in="${itemsS}" status="index" var="item">
            <li>
                <g:img uri="${item.thumbnail}" ></g:img>
                ${item.title}
                <g:checkBox name="check-item-${item.id}" />
            </li>
        </g:each>
    </ul>
</div>