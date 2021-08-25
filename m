Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 847643F79EA
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Aug 2021 18:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629907896;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7YQt2cK1R+1HWsPI2AmvnE6u70xG1T5yryI+ecPTzn0=;
	b=OlzSMNXJNhQZrBC20PdYzQLtdhncwSwAfbAYCABxAhDGVWYzcEVWKUATquWN6prJhvASUR
	NjzVPtI95kfl9zySa0ASwoXWHsp13RqHNJ/Dpq1bJJ+GZckL2HQ22RMYbwdHL5F561qi6+
	mvGg0AYfNZq67xall2l2d6BOop85De8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-cskqAwuzORaW08uNngr-uA-1; Wed, 25 Aug 2021 12:11:34 -0400
X-MC-Unique: cskqAwuzORaW08uNngr-uA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EA5C8042F4;
	Wed, 25 Aug 2021 16:11:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58003797C5;
	Wed, 25 Aug 2021 16:11:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A0994A7C8;
	Wed, 25 Aug 2021 16:11:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17PGBP9m000639 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Aug 2021 12:11:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0DE5B21EE57D; Wed, 25 Aug 2021 16:11:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0814121EC5E8
	for <cluster-devel@redhat.com>; Wed, 25 Aug 2021 16:11:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E42D2967603
	for <cluster-devel@redhat.com>; Wed, 25 Aug 2021 16:11:17 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
	[209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-390-iV04rUVBOhqo6ykZlCg3dQ-1; Wed, 25 Aug 2021 12:11:16 -0400
X-MC-Unique: iV04rUVBOhqo6ykZlCg3dQ-1
Received: by mail-io1-f72.google.com with SMTP id
	o5-20020a6bf8050000b02905b026202a6fso14756219ioh.21
	for <cluster-devel@redhat.com>; Wed, 25 Aug 2021 09:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7YQt2cK1R+1HWsPI2AmvnE6u70xG1T5yryI+ecPTzn0=;
	b=Uz7xkmJc2V2JfDfX4jsFSIf0GJYAW6owf0A4RQz/YY2qG4q/dfvLyg1hQIweP4Su6I
	gmW6pZOBbjIZsXH9G2sBMqrFjX8NQIUWwNMkcQKZ4ffYniv8TsyYIMELB0UGmvxYP5w4
	0ooCB2xFH2Yq0U1P2/CUt8cTUphBRxhscfqd2pYtf98i3kbfuzk9TMfAsWgj42JGDcix
	cJWul+af+m1PGEu208j+GtiTC0dbBYMqL64yvzwY0ZPqjvXyFY35GDDBfLNIplF+T3JR
	05+yD2H11VPsuMCUYFhCjD8k9SLVrOqmnkQohD6M87Gu3Qhm4STETht6jYGQkqNja+9e
	fC+g==
X-Gm-Message-State: AOAM53072ZA45erYW/gXjV1XGiha68Wu3MjQg2iAWJ78/bcRPJKZS6uW
	FZMF8/Q95OeMI7Xb/zrkBJFEeAKDp4XuOHPJhngvOro7CT6jJzd6QOCsXIjj/Psny18jTRbufDD
	3Xi1jZ2hGLQoVouiRvvC6Goxfv0lEyfjsoOH6/5Tugqz8UzB89PU9zOZqL51qY9btNq8q9fy8VA
	==
X-Received: by 2002:a05:6602:d9:: with SMTP id
	z25mr36661436ioe.154.1629907875622; 
	Wed, 25 Aug 2021 09:11:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9VwoJfqSZ7u27GdOV5VAE0Hbt544HLRDG1RvNikkOfULvZDTXKsqWdit5gXzpQKMkaQ84MQ==
X-Received: by 2002:a05:6602:d9:: with SMTP id
	z25mr36661413ioe.154.1629907875350; 
	Wed, 25 Aug 2021 09:11:15 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id i14sm86827iog.47.2021.08.25.09.11.14
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 25 Aug 2021 09:11:14 -0700 (PDT)
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20210824140241.149386-1-rpeterso@redhat.com>
	<20210824140241.149386-2-rpeterso@redhat.com>
	<CAHc6FU7SLAyoMc828JPAjb_z9YBM=dESDA3Lir5HWRt0e6ri3Q@mail.gmail.com>
	<26cea225-e7c4-bf96-57a2-5416ffb7d8c2@redhat.com>
	<CAHc6FU4bae8A6LaXWHO2sWcN9-PBC3bjyydjefggXCYsuCHzJw@mail.gmail.com>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <a2c342c6-aab1-7eeb-4347-e1a6361607c3@redhat.com>
Date: Wed, 25 Aug 2021 11:11:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHc6FU4bae8A6LaXWHO2sWcN9-PBC3bjyydjefggXCYsuCHzJw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 1/3] gfs2: switch go_xmote_bh glop
 to pass gh not gl
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/24/21 5:27 PM, Andreas Gruenbacher wrote:
> On Tue, Aug 24, 2021 at 6:48 PM Bob Peterson <rpeterso@redhat.com> wrote:
>> On 8/24/21 11:12 AM, Andreas Gruenbacher wrote:
>>> On Tue, Aug 24, 2021 at 4:02 PM Bob Peterson <rpeterso@redhat.com> wrote:
>>>> Before this patch, the go_xmote_bh function was passed gl, the glock
>>>> pointer. This patch switches it to gh, the holder, which points to the gl.
>>>> This facilitates improvements for the next patch.
>>>>
>>>> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
>>>> ---
>>>>    fs/gfs2/glock.c  | 4 ++--
>>>>    fs/gfs2/glops.c  | 5 +++--
>>>>    fs/gfs2/incore.h | 2 +-
>>>>    3 files changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
>>>> index e0eaa9cf9fb6..d43eed1696ab 100644
>>>> --- a/fs/gfs2/glock.c
>>>> +++ b/fs/gfs2/glock.c
>>>> @@ -562,9 +562,9 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
>>>>           if (test_and_clear_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags))
>>>>                   gfs2_demote_wake(gl);
>>>>           if (state != LM_ST_UNLOCKED) {
>>>> -               if (glops->go_xmote_bh) {
>>>> +               if (gh && glops->go_xmote_bh) {
>>>
>>> This changes when the callback is called. Please explain why that's okay.
>>
>> This is okay because patch 3 eliminates go_xmote_bh() completely anyway.
>> I just threw the "gh &&" as an abundance of precaution.
> 
> I didn't mean this as a joke. This patch changes when the go_xmote_bh
> hook is called, and there is no mention why that's a safe thing to do.
> Then the go_xmote_bh hook is removed in favor of go_lock, which is yet
> called under different circumstances, and again there is no mention
> why that doesn't matter and we still end up calling freeze_go_xmote_bh
> (now freeze_go_lock) in the right circumstances.
> 
> Also, it's never been okay to break things just because a patch
> further down the line fixes it again (or breaks it in a different
> way). Please explain your changes; this also serves to document that
> you haven't accidentally missed a case.
> 
> Thanks,
> Andreas
> 
Hi Andreas,

The patch doesn't really change when the go_xmote_bh hook is called
because of the various circumstances under which it's called:

First of all, bear in mind that the only user of go_xmote_bh is the 
freeze glock.
There are only three places from which finish_xmote() is called:
(1) do_xmote calls finish_xmote for target == LM_ST_UNLOCKED.
     In this case finish_xmote() only calls glops->go_xmote_bh if state
     != LM_ST_UNLOCKED, so in this case, go_xmote_bh (and also
     do_promote) can never be called.
(2) do_xmote calls finish_xmote but only if lock_nolock locking
     protocol, which grants a holder immediately rather than making a
     lock request to dlm. In this case a holder must exist in this case
     because:
        do_xmote has the following callers:
           (2a) run_queue's call to do_xmote at the end, which passes in
                target as gl->gl_target.
                This is preceded by one of two cases:
                (2aa) If the GLF_DEMOTE bit is set, gh is passed in NULL,
                   but in that case gl->gl_target = gl->gl_demote_state.
                   We know gl->gl_demote_state cannot be LM_ST_EXCLUSIVE
                   or it would BUG_ON before the call. Since the freeze
                   glock is never taken in DEFERRED, it must be either
                   LM_ST_UNLOCKED or LM_ST_SHARED. If it is
                   LM_ST_UNLOCKED, finish_xmote will never call
                   go_xmote_bh because of "if (state != LM_ST_UNLOCKED)".
                   So we need only worry about SHARED.
                   (2aaa) There's only one place gl_demote_state is set
                      to a variable that could result in SHARED:
                      handle_callback. There's only one place
                      handle_callback is called with a variable that
                      could result in SHARED: gfs2_glock_cb.
                      There's only one place gfs2_glock_cb is called with
                      the constant LM_ST_SHARED: a callback from dlm,
                      which is impossible because we stated in (2) that
                      this is lock_nolock.
                      There's only one place gfs2_glock_cb is called with
                      a variable that could result in SHARED: sys.c when
                      the special gfs2 sysfs file is used to manually
                      force-promote a glock. This should never be used by
                      customers except in extreme deadlock situations,
                      and under the direction of support. It is not
                      tested, advised, nor recommended. Under normal
                      running conditions, this will never be called.
                (2ab) The GLF_DEMOTE test fails in run_queue. Prior to
                      its call to do_xmote it does:
                      "gh = find_first_waiter(gl);" then immediately
                      dereferences gh. So we know gh must be valid or
                      we would see kernel panic: finish_xmote will surely
                      find the same gh it dereferences here.
           (2b) finish_xmote has two calls back into do_xmote if its lock
                state change was not granted by dlm (conversion
                deadlock). We don't need to worry about these two calls
                because this is lock_nolock as per (2).
(3) glock_work_func calls finish_xmote if the GLF_REPLY_PENDING bit it
     set, passing gl_reply. Essentially this is the async/dlm version of
     the synchronous/nolock found in (1). But gl_reply is only set one
     place: gfs2_glock_complete which is a dlm callback.
     We can only get a dlm callback to gfs2_glock_complete from gdlm_ast,
     which is a reply to a lock (not unlock) request. A lock request is
     only made from do_xmote(), in which case glock_work_func's call to
     finish_xmote is responding to an async reply from dlm to that lock
     request. A lock request implies there's a "waiter" holder record
     which will be found by finish_xmote and passed into go_xmote_bh.

If you like, I can add a comment similar to the above to patch 1, but
I didn't see the great need to document all this, since the whole
go_xmote_bh concept is being replaced by the third patch anyway.

Before the third patch, finish_xmote() called BOTH go_xmote_bh() glop
(if one exists) AND do_promote(), which calls go_lock() glop (if one
exists) when the head-of-the-list holder is promoted. Calling
go_xmote_bh multiple times for multiple holders doesn't even make sense
for the freeze glock: we should not check the journal for a clean
unmount multiple times during a single freeze/thaw process.

The freeze glock will never have multiple SH holders on the same
cluster node because of the way gfs2's freeze/thaw mechanism works.
There are only 2 possible holders: (1) the EX holder while the file
system is frozen and (2) the SH holder that waits for the unfreeze.

So patch 3 switches the freeze glock to use the standard go_lock()
mechanism rather than go_xmote_bh, which is so poorly-thought-out that
patch 2 is needed to fix its short-comings.

Since the freeze glock did not already have a go_lock glop, switching
it from the go_xmote_bh glop to the go_lock glop retains the same
function called at essentially the same time.

Regards,

Bob

