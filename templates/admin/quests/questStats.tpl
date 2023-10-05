<div class="row">
  <div class="col-md-6">
    <div class="well">
      Finished {$stats.finished|number_format} times
    </div>
  </div>

  <div class="col-md-6">
    <div class="well">
      Finished {$stats.uniq|number_format} unique times
    </div>
  </div>
</div> 

<h1>Feedbacks</h3>
<hr/>

<div class="text-center">
{$pages}
</div>
{foreach from = $feedback item = item}

<div class="panel panel-future">
	<div class="panel-heading">
		{$item.username|profile_link}
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-4">
				<button disabled>
				Difficulty: {$item.difficulty_rating}
				</button>
			</div>
			<div class="col-md-4">
				<button disabled>
				Time: {$item.time_rating}
				</button>
			</div>
			<div class="col-md-4">
				<button disabled>
				Replay value: {$item.replay_rating}
				</button>
			</div>
		</div>
		<br/>
		{$item.feedback}
	</div>
	<div class="panel-footer text-right">
		{$item.created|date_fashion}
	</div>
</div>

{foreachelse}
<button disabled>no feedback</button>
{/foreach}

<div class="text-center">
{$pages}
</div>