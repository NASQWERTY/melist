<div id="temp" class="ch-box panelItems">
    <ul>
        <g:each in="${selectedItems}" status="index" var="item">
            <li>
                <g:img uri="${item.thumbnail}" ></g:img>
                <h1>$${item.price}</h1>
                <h1>${item.title}</h1>
            </li>
        </g:each>
    </ul>
</div>