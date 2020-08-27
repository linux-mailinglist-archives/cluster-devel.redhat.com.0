Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5C373253F69
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 09:41:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598514090;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6RtqWFvB4jdTd7swsugYcUmUW8RySpBLhUTjGCPvHQM=;
	b=DUsGHsbI2gQmGWFTgKaKHEpeUlgnTrhrN1WINhBIvuiMhaAvoKrHjljGRQA4sVH6F5qSYG
	Y70r496xxP20oNtH6tkTlxVkHvpT8Q+lBpSlljDcEP/XvJgwgXO5Rh1Dor3fl4lMM/AgLD
	rCYMUYmEnx7+dQi+IbCaH/i311SjP6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-ZFqf95JsNCqp0rgPr2jaBg-1; Thu, 27 Aug 2020 03:41:28 -0400
X-MC-Unique: ZFqf95JsNCqp0rgPr2jaBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D26A8064BC;
	Thu, 27 Aug 2020 07:41:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B6EA19646;
	Thu, 27 Aug 2020 07:41:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7C90181A06B;
	Thu, 27 Aug 2020 07:41:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07R7fIIJ031343 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 03:41:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E8B219930; Thu, 27 Aug 2020 07:41:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82B781992F;
	Thu, 27 Aug 2020 07:41:11 +0000 (UTC)
To: Andreas Gruenbacher <agruenba@redhat.com>,
	Bob Peterson <rpeterso@redhat.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
	<20200821173337.20377-7-rpeterso@redhat.com>
	<CAHc6FU4u5NW3FYwTz0E4zVp5KWejtUc67YXjMXJNmL=wJfuHjg@mail.gmail.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <5483bd60-7daf-5f0b-dec0-a19bfc2091aa@redhat.com>
Date: Thu, 27 Aug 2020 08:41:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHc6FU4u5NW3FYwTz0E4zVp5KWejtUc67YXjMXJNmL=wJfuHjg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 06/12] gfs2: Create transaction for
 inodes with i_nlink != 0
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 27/08/2020 07:00, Andreas Gruenbacher wrote:
> On Fri, Aug 21, 2020 at 7:33 PM Bob Peterson <rpeterso@redhat.com> wrote:
>> Before this patch, function gfs2_evict_inode would check if i_nlink
>> was non-zero, and if so, go to label out. The problem is, the evicted
>> file may still have outstanding pages that need invalidating, but
>> the call to truncate_inode_pages_final at label out doesn't start a
>> transaction. It needs a transaction in order to write revokes for any
>> pages it has to invalidate.
> This is only true for jdata inodes though, right? If so, I'd rather
> just create transactions in the jdata case.

Yes, and also if the inode is being deallocated, then we might be able 
to skip that step. We'll no doubt have to retain it in case this is just 
an unlink and there are still openers somewhere,

Steve.


>> This patch removes the early check for i_nlink in gfs2_evict_inode.
>> Not much further down in the code, there's another check for i_nlink
>> that skips to out_truncate. That one is proper because the calls
>> to truncate_inode_pages after out_truncate use a proper transaction,
>> so the page invalidates and subsequent revokes may be done properly.
>>
>> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
>> ---
>>   fs/gfs2/super.c | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
>> index 80ac446f0110..1f3dee740431 100644
>> --- a/fs/gfs2/super.c
>> +++ b/fs/gfs2/super.c
>> @@ -1344,7 +1344,7 @@ static void gfs2_evict_inode(struct inode *inode)
>>                  return;
>>          }
>>
>> -       if (inode->i_nlink || sb_rdonly(sb))
>> +       if (sb_rdonly(sb))
>>                  goto out;
>>          if (test_bit(GIF_ALLOC_FAILED, &ip->i_flags)) {
>> @@ -1370,15 +1370,19 @@ static void gfs2_evict_inode(struct inode *inode)
>>          }
>>
>>          if (gfs2_inode_already_deleted(ip->i_gl, ip->i_no_formal_ino))
>> -               goto out_truncate;
>> +               goto out_flush;
>>          error = gfs2_check_blk_type(sdp, ip->i_no_addr, GFS2_BLKST_UNLINKED);
>> -       if (error)
>> -               goto out_truncate;
>> +       if (error) {
>> +               error = 0;
>> +               goto out_flush;
>> +       }
>>
>>          if (test_bit(GIF_INVALID, &ip->i_flags)) {
>>                  error = gfs2_inode_refresh(ip);
>> -               if (error)
>> -                       goto out_truncate;
>> +               if (error) {
>> +                       error = 0;
>> +                       goto out_flush;
>> +               }
>>          }
>>
>>          /*
>> @@ -1392,7 +1396,7 @@ static void gfs2_evict_inode(struct inode *inode)
>>              test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
>>                  if (!gfs2_upgrade_iopen_glock(inode)) {
>>                          gfs2_holder_uninit(&ip->i_iopen_gh);
>> -                       goto out_truncate;
>> +                       goto out_flush;
>>                  }
>>          }
>>
>> @@ -1424,7 +1428,7 @@ static void gfs2_evict_inode(struct inode *inode)
>>          gfs2_inode_remember_delete(ip->i_gl, ip->i_no_formal_ino);
>>          goto out_unlock;
>>
>> -out_truncate:
>> +out_flush:
>>          gfs2_log_flush(sdp, ip->i_gl, GFS2_LOG_HEAD_FLUSH_NORMAL |
>>                         GFS2_LFC_EVICT_INODE);
>>          metamapping = gfs2_glock2aspace(ip->i_gl);
>> @@ -1435,6 +1439,7 @@ static void gfs2_evict_inode(struct inode *inode)
>>          write_inode_now(inode, 1);
>>          gfs2_ail_flush(ip->i_gl, 0);
>>
>> +out_truncate:
>>          nr_revokes = inode->i_mapping->nrpages + metamapping->nrpages;
>>          if (!nr_revokes)
>>                  goto out_unlock;
>> --
>> 2.26.2
>>
> Thanks,
> Andreas
>

