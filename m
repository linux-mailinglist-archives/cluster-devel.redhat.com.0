Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2343910371
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 02:10:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AE4D30820DD;
	Wed,  1 May 2019 00:10:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0162B6B8F9;
	Wed,  1 May 2019 00:10:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4786718089CB;
	Wed,  1 May 2019 00:10:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4108gMU001204 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 20:08:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CFABC7C850; Wed,  1 May 2019 00:08:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from localhost.localdomain (ovpn-121-218.rdu2.redhat.com
	[10.10.121.218])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45CDC7C828;
	Wed,  1 May 2019 00:08:40 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>,
	cluster-devel <cluster-devel@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
	<20190430230319.10375-10-rpeterso@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <550f4715-669a-5e58-43d2-46b84e08285f@redhat.com>
Date: Wed, 1 May 2019 01:08:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430230319.10375-10-rpeterso@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH v3 09/19] gfs2: Ignore recovery
 attempts if gfs2 has io error or is withdrawn
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 01 May 2019 00:10:22 +0000 (UTC)

Hi,

On 01/05/2019 00:03, Bob Peterson wrote:
> This patch addresses various problems with gfs2/dlm recovery.
>
> For example, suppose a node with a bunch of gfs2 mounts suddenly
> reboots due to kernel panic, and dlm determines it should perform
> recovery. DLM does so from a pseudo-state machine calling various
> callbacks into lock_dlm to perform a sequence of steps. It uses
> generation numbers and recover bits in dlm "control" lock lvbs.
>
> Now suppose another node tries to recover the failed node's
> journal, but in so doing, encounters an IO error or withdraws
> due to unforeseen circumstances, such as an hba driver failure.
> In these cases, the recovery would eventually bail out, but it
> would still update its generation number in the lvb. The other
> nodes would all see the newer generation number and think they
> don't need to do recovery because the generation number is newer
> than the last one they saw, and therefore someone else has already
> taken care of it.
>
> If the file system has an io error or is withdrawn, it cannot
> safely replay any journals (its own or others) but someone else
> still needs to do it. Therefore we don't want it messing with
> the journal recovery generation numbers: the local generation
> numbers eventually get put into the lvb generation numbers to be
> seen by all nodes.
>
> This patch adds checks to many of the callbacks used by dlm
> in its recovery state machine so that the functions are ignored
> and skipped if an io error has occurred or if the file system
> was withdraw.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>

These should probably propagate the error back to the caller of the 
recovery request. We do have a proper notification system for failed 
recovery via uevents,

Steve.

> ---
>   fs/gfs2/lock_dlm.c | 18 ++++++++++++++++++
>   fs/gfs2/util.c     | 15 +++++++--------
>   2 files changed, 25 insertions(+), 8 deletions(-)
>
> diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
> index 31df26ed7854..9329f86ffcbe 100644
> --- a/fs/gfs2/lock_dlm.c
> +++ b/fs/gfs2/lock_dlm.c
> @@ -1081,6 +1081,10 @@ static void gdlm_recover_prep(void *arg)
>   	struct gfs2_sbd *sdp = arg;
>   	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
>   
> +	if (gfs2_withdrawn(sdp)) {
> +		fs_err(sdp, "recover_prep ignored due to withdraw.\n");
> +		return;
> +	}
>   	spin_lock(&ls->ls_recover_spin);
>   	ls->ls_recover_block = ls->ls_recover_start;
>   	set_bit(DFL_DLM_RECOVERY, &ls->ls_recover_flags);
> @@ -1103,6 +1107,11 @@ static void gdlm_recover_slot(void *arg, struct dlm_slot *slot)
>   	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
>   	int jid = slot->slot - 1;
>   
> +	if (gfs2_withdrawn(sdp)) {
> +		fs_err(sdp, "recover_slot jid %d ignored due to withdraw.\n",
> +		       jid);
> +		return;
> +	}
>   	spin_lock(&ls->ls_recover_spin);
>   	if (ls->ls_recover_size < jid + 1) {
>   		fs_err(sdp, "recover_slot jid %d gen %u short size %d\n",
> @@ -1127,6 +1136,10 @@ static void gdlm_recover_done(void *arg, struct dlm_slot *slots, int num_slots,
>   	struct gfs2_sbd *sdp = arg;
>   	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
>   
> +	if (gfs2_withdrawn(sdp)) {
> +		fs_err(sdp, "recover_done ignored due to withdraw.\n");
> +		return;
> +	}
>   	/* ensure the ls jid arrays are large enough */
>   	set_recover_size(sdp, slots, num_slots);
>   
> @@ -1154,6 +1167,11 @@ static void gdlm_recovery_result(struct gfs2_sbd *sdp, unsigned int jid,
>   {
>   	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
>   
> +	if (gfs2_withdrawn(sdp)) {
> +		fs_err(sdp, "recovery_result jid %d ignored due to withdraw.\n",
> +		       jid);
> +		return;
> +	}
>   	if (test_bit(DFL_NO_DLM_OPS, &ls->ls_recover_flags))
>   		return;
>   
> diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
> index 0a814ccac41d..7eaea6dfe1cf 100644
> --- a/fs/gfs2/util.c
> +++ b/fs/gfs2/util.c
> @@ -259,14 +259,13 @@ void gfs2_io_error_bh_i(struct gfs2_sbd *sdp, struct buffer_head *bh,
>   			const char *function, char *file, unsigned int line,
>   			bool withdraw)
>   {
> -	if (!test_bit(SDF_SHUTDOWN, &sdp->sd_flags))
> -		fs_err(sdp,
> -		       "fatal: I/O error\n"
> -		       "  block = %llu\n"
> -		       "  function = %s, file = %s, line = %u\n",
> -		       (unsigned long long)bh->b_blocknr,
> -		       function, file, line);
> +	if (gfs2_withdrawn(sdp))
> +		return;
> +
> +	fs_err(sdp, "fatal: I/O error\n"
> +	       "  block = %llu\n"
> +	       "  function = %s, file = %s, line = %u\n",
> +	       (unsigned long long)bh->b_blocknr, function, file, line);
>   	if (withdraw)
>   		gfs2_lm_withdraw(sdp, NULL);
>   }
> -

