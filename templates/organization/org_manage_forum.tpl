{include file="dialogs/osx_dialog_box.tpl" id="new_section" title="New forum section" content='
<form method="post" class="text-center">
	<input type="text" name="name" placeholder="Section name" maxlength="70" />
	<input type="submit" value="Process" name="new_section"/>
</form>
 '} 
 
 <div class="row">
    <div class="col-md-9">
      <h3>Forum</h3>
    </div>
    <div class="col-md-3 text-right">
      <a href="#myModalnew_section" data-toggle="modal"><button>New forum section</button></a>
    </div>
  </div>
  
 {foreach from=$sections item=section}
  {if $section.type eq 2}
  
      <div class="row">
        <div class="col-md-12">
    
      <div class="row-fluid">
        <div class="col-md-6 nopadding">
          <div class="well nomargin">
            [SECTION] {$section.name}
          </div>
        </div>
        <div class="col-md-2 nopadding">
          <a href="#myModal{$section.id}" data-toggle="modal"><button>New forum</button></a>
          {include file="dialogs/osx_dialog_box.tpl" id={$section.id} title="New forum section" content='
          <form method="post" class="text-center">
            <input type="text" name="name" placeholder="Forum name" maxlength=70/>
            <input type="hidden" name="section" value="{$section.id}"/>
            <input type="submit" value="Process" name="new_forum"/>
          </form>
           '} 
          </div>
          <div class="col-md-2 nopadding">
            <a href="#myModal{$section.id+1000}" data-toggle="modal" class="button text-center">Modify</a>
          {include file="dialogs/osx_dialog_box.tpl" id={$section.id+1000} title="Edit section" content='
          <form method="post" class="text-center">
            <input type="text" name="name" placeholder="Section name" maxlength=70 value="{$section.name}"/>
            <input type="text" name="order" placeholder="Order" maxlength=5 size=5 value="{$section.ord}"/>
            <input type="hidden" name="section" value="{$section.id}"/>
            <input type="submit" value="Process" name="edit_section"/>
          </form>
           '} 
          </div>
          <div class="col-md-2 nopadding">
            <a href="#myModal{$section.id+500}" data-toggle="modal" class="button text-center">Delete</a>
          {include file="dialogs/osx_dialog_box.tpl" id={$section.id+500} title="Confirm action" content='
          <form method="post" class="text-center">
            <input type="hidden" name="del_section" value="{$section.id}"/>
            <input type="submit" value="Delete section {$section.name}"/>
          </form>
           '}
           </div>
        </div>
      </div>

    </div>
    <div style="padding:10px;">
       {foreach from = $sections item=f key=k}
        {if $f.parent eq $section.id}
        <div class="row">
          <div class="col-md-12">
        <div class="row-fluid">
          <div class="col-md-8 nopadding">
            <div class="well nomargin">
              [FORUM] {$f.name}
          
            </div>
          </div>
          <div class="col-md-2 nopadding">
            <a href="#myModal{$f.id+1000}" data-toggle="modal" class="button text-center">Modify</a>
            {include file="dialogs/osx_dialog_box.tpl" id={$f.id+1000} title="Edit forum" content='
            <form method="post" class="text-center">
              <input type="text" name="name" placeholder="Forum name" maxlength=70 value="{$f.name}"/>
              <input type="text" name="order" placeholder="Order" maxlength=5 size=5 value="{$f.ord}"/>
              <input type="hidden" name="section" value="{$f.id}"/>
              <input type="submit" value="Process" name="edit_section"/>
            </form>
             '} 
             </div>
            <div class="col-md-2 nopadding">
              <a href="#myModal{$f.id+500}" data-toggle="modal" class="button text-center">Delete</a>
            {include file="dialogs/osx_dialog_box.tpl" id={$f.id+500} title="Confirm action" content='
            <form method="post" class="text-center">
              <input type="hidden" name="del_section" value="{$f.id}"/>
              <input type="submit" value="Delete forum {$f.name}"/>
            </form>
             '}
            </div>
          </div>
        </div>
      </div>
      {/if}
	
	 {/foreach}
</div>
  {/if}

 {/foreach}