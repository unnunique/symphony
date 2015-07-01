<#include "macro-notifications.ftl">
<@notifications "at">
<#if atNotifications?size != 0>
<ul class="notification">
    <#list atNotifications as notification>
    <li class="fn-clear<#if notification.hasRead> read</#if>">
        <a target="_blank" rel="nofollow" href="/member/${notification.authorName}" 
           title="${notification.authorName}">
            <img class="avatar fn-left" src="${notification.thumbnailURL}"/>
        </a>
        <#if !notification.atInArticle>
        <h2 class="fn-inline"><a rel="bookmark" href="${notification.url}"> ${notification.articleTitle}</a></h2>
        <span class="ft-small fn-right">
            <span class="icon icon-date"></span>
            ${notification.createTime?string('yyyy-MM-dd HH:mm')}
        </span>
        <div class="content-reset comment">
            ${notification.content}
        </div>
        <#else>
        <div class="list-content fn-left">
            <h2><a rel="bookmark" href="${notification.url}"> ${notification.articleTitle}</a></h2>
            <div class="comment">
                <p class="ft-small">
                    <span class="icon icon-tags"></span>
                    <#list notification.articleTags?split(",") as articleTag>
                    <a rel="tag" href="/tags/${notification?url('UTF-8')}">
                        ${articleTag}</a><#if notification_has_next>, </#if>
                    </#list>
                    &nbsp; 
                    <span class="icon icon-date"></span>
                    ${notification.createTime?string('yyyy-MM-dd HH:mm')}
                </p>
            </div>  
        </div>
        <#if notification.articleCommentCount != 0>
        <div class="cmts" title="${cmtLabel}">
            <a class="count ft-small" href="${notification.url}">${notification.articleCommentCount}</a>
        </div>
        </#if>
        </#if>
    </li>
    </#list>
</ul>
<#else>
${noMessageLabel}
</#if>

<@pagination url="/notifications/at"/>
</@notifications>