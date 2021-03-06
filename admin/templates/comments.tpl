<h3 class="ui-corner-all">{$SystemVersion} - {i18n('Comments')}</h3>
{if $message}<div class="{$class}">{$message}</div>{/if}

{if $edit}
	<form id="This" action="{$URL_REQUEST}" method="post">
		<div class="tbl1">
			<div class="formLabel sep_1 grid_3"><label for="comment_post">{i18n('Content:')}</label></div>
			<div class="formField grid_7"><textarea name="post" id="comment_post" rows="5">{$edit.post}</textarea></div>
		</div>
		<div class="tbl AdminButtons">
			<div class="center grid_2 button-l">
				<span class="Cancel"><strong>{i18n('Back')}<img src="{$ADDR_ADMIN_ICONS}pixel/undo.png" alt="" /></strong></span>
			</div>
			<div class="center grid_2 button-r">
				<input type="hidden" name="save" value="yes" />
				<span id="SendForm_This" class="Save"><strong>{i18n('Save')}<img src="{$ADDR_ADMIN_ICONS}pixel/diskette.png" alt="" /></strong></span>
			</div>
		</div>
	</form>
{else}
	{if $comment}
		<table id="TableOPT" class="dataTable">
			<thead>
				<tr>
					<th style="width:20%">{i18n('Author')}</th>
					<th style="width:20%">{i18n('IP')}</th>
					<th style="width:20%">{i18n('Date')}</th>
					<th style="width:20%">{i18n('Content')}</th>
					<th style="width:20%">{i18n('Management')}</th>
				</tr>
			</thead>
			<tbody>
				{section=comment}
					<tr class="tbl1 border_bottom">
						<td style="width:20%" class="left">{$comment.author}</td>
						<td style="width:20%" class="left">{$comment.ip}</td>
						<td style="width:20%" class="left">{$comment.datestamp}</td>
						<td style="width:20%" class="left">{$comment.post}</td>
						<td style="width:20%" class="center">
							<a href="{$FILE_SELF}?action=edit&amp;id={$comment.id}" class="tip" title="{i18n('Edit')}">
								<img src="{$ADDR_ADMIN_ICONS}edit.png" alt="{i18n('Edit')}" />
							</a>
							<a href="{$FILE_SELF}?action=delete&amp;id={$comment.id}" class="tip confirm_button" title="{i18n('Delete')}">
								<img src="{$ADDR_ADMIN_ICONS}delete.png" alt="{i18n('Delete')}" />
							</a>
						</td>
					</tr>
				{/section}
			</tbody>
		</table>
		<div class="tbl AdminButtons">
			<div class="center grid_2 button-c">
				<span class="Cancel"><strong>{i18n('Back')}<img src="{$ADDR_ADMIN_ICONS}pixel/undo.png" alt="" /></strong></span>
			</div>
		</div>
	{else}
		<div class="tbl2">
			<div class="sep_1 grid_10 center">{i18n('There are no comments.')}</div>
		</div>
		<div class="tbl AdminButtons">
			<div class="center grid_2 button-c">
				<span class="Cancel"><strong>{i18n('Back')}<img src="{$ADDR_ADMIN_ICONS}pixel/undo.png" alt="" /></strong></span>
			</div>
		</div>
	{/if}
{/if}