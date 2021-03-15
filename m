Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 97E1733BF67
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Mar 2021 16:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615820771;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l8eSJHHN5DCrwEnPVc2ip99aIaSjcKKrOBagmhpSZDE=;
	b=Fj3hoyD7t1k7wyBT94Q+rohOCrwCOElRj0M043DfO5cM6kbTp6Tk8+2/sO3fauKS6eb2Jh
	o1xJUJF0kKuZxFvEgCIqleaoPUFa4bNVsMP2VqTjsrX1AikDfGDfTXQs3mZ6YjZlxnXtRE
	DsMxSxxmWgLrh+S7kayCWAp8z9AmeB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-JFA0bnoMOf2AHwqfRbecRg-1; Mon, 15 Mar 2021 11:06:09 -0400
X-MC-Unique: JFA0bnoMOf2AHwqfRbecRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D81786ABD7;
	Mon, 15 Mar 2021 15:06:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 281365D751;
	Mon, 15 Mar 2021 15:06:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D01B18155DE;
	Mon, 15 Mar 2021 15:06:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12FF63Mo020727 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 15 Mar 2021 11:06:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C50119701; Mon, 15 Mar 2021 15:06:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.36.115.218] (ovpn-115-218.ams2.redhat.com [10.36.115.218])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47E7019702;
	Mon, 15 Mar 2021 15:05:58 +0000 (UTC)
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20210315122400.1636159-1-anprice@redhat.com>
	<CAHc6FU5X3=7YF65Tspn2zrpMzzTmz_NknsQfZYUPYRWiQADm_Q@mail.gmail.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <a7d31756-f029-748c-7f0d-5323fb2c896b@redhat.com>
Date: Mon, 15 Mar 2021 15:05:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHc6FU5X3=7YF65Tspn2zrpMzzTmz_NknsQfZYUPYRWiQADm_Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Flag a withdraw if init_threads()
 fails
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15/03/2021 14:32, Andreas Gruenbacher wrote:
> On Mon, Mar 15, 2021 at 1:24 PM Andrew Price <anprice@redhat.com> wrote:
>> Interrupting mount with ^C quickly enough can cause the kthread_run()
>> calls in gfs2's init_threads() to fail and the error path leads to a
>> deadlock on the s_umount rwsem. The abridged chain of events is:
>>
>>    [mount path]
>>    get_tree_bdev()
>>      sget_fc()
>>        alloc_super()
>>          down_write_nested(&s->s_umount, SINGLE_DEPTH_NESTING); [acquired]
>>      gfs2_fill_super()
>>        gfs2_make_fs_rw()
>>          init_threads()
>>            kthread_run()
>>              ( Interrupted )
>>        [Error path]
>>        gfs2_gl_hash_clear()
>>          flush_workqueue(glock_workqueue)
>>            wait_for_completion()
>>
>>    [workqueue context]
>>    glock_work_func()
>>      run_queue()
>>        do_xmote()
>>          freeze_go_sync()
>>            freeze_super()
>>              down_write(&sb->s_umount) [deadlock]
>>
>> In freeze_go_sync() there is a gfs2_withdrawn() check that we can use to
>> make sure freeze_super() is not called in the error path, so add a
>> gfs2_withdraw_delayed() call when init_threads() fails.
>>
>> Ref: https://bugzilla.kernel.org/show_bug.cgi?id=212231
>>
>> Reported-by: Alexander Aring <aahringo@redhat.com>
>> Signed-off-by: Andrew Price <anprice@redhat.com>
>> ---
>>   fs/gfs2/super.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
>> index 97076d3f562f..9e91c9d92bd6 100644
>> --- a/fs/gfs2/super.c
>> +++ b/fs/gfs2/super.c
>> @@ -162,8 +162,10 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
>>          int error;
>>
>>          error = init_threads(sdp);
>> -       if (error)
>> +       if (error) {
>> +               gfs2_withdraw_delayed(sdp);
> 
> Hmm, marking the filesystem as withdrawing before we've even started
> looks a bit odd,

I agree, it's not elegant. I'm not confident that I understand why there 
is work queued to freeze the fs at this point but this is the cleanest 
way I can think of to prevent that right now. Perhaps we can come up 
with something better.

Andy

> but given that we're already checking for withdrawing
> / withdrawn filesystems all over the place, it should be okay. I'll
> push this to for-next.
> 
>>                  return error;
>> +       }
>>
>>          j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
>>          if (gfs2_withdrawn(sdp)) {
>> --
>> 2.29.2
> 
> Thanks,
> Andreas
> 

