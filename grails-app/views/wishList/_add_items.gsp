<div id="temp" class="ch-box panelItems">
    <ul>
        <g:each in="${selectedItems}" status="index" var="item">
            <li>
                <g:img uri="${item.thumbnail}" ></g:img>
                ${item.title}
            </li>
        </g:each>
    </ul>
</div>