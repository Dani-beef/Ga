

<!-- Modal -->
<div class="modal fade" id="myModal{eval var=$id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      {if !$no_title}
        <div class="modal-header">
		  <a class="close-button" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></a>
          <h4 class="modal-title" id="myModalLabel">{eval var=$title}</h4>
        </div>
      {/if}
      <div class="modal-body">
        {eval var=$content}
      </div>
     
    </div>
  </div>
</div>




		