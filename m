Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 054D56F82F4
	for <lists+cluster-devel@lfdr.de>; Fri,  5 May 2023 14:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683289790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Slcx5wUxYzYcA9ed7GVD8B47/DHINL2dYxrdBjgJtuY=;
	b=E9P8+HnudetInvhI+RK/58YmnpUFSGm+0xEdAeLA+Mktjuy0CbrXSCXij4mKzoMv5eMbwJ
	ol63aCqBO/Ij5GHNmmSGRM1qA8u4lLPX5DEpFcAlr4QMSj+xnHFgx7wMx3CqaS46vyzZRg
	H9wCCxWxOynvE45fHmjCUWXOqloXLnk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-FcWFtBPLN1yEl-OQ1Nd7cg-1; Fri, 05 May 2023 08:29:47 -0400
X-MC-Unique: FcWFtBPLN1yEl-OQ1Nd7cg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91DE985A5A3;
	Fri,  5 May 2023 12:29:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E580492B00;
	Fri,  5 May 2023 12:29:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9BAA31946A4A;
	Fri,  5 May 2023 12:29:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F261E1946A43 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  5 May 2023 12:29:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A06842026E1C; Fri,  5 May 2023 12:29:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 998132026DFD
 for <cluster-devel@redhat.com>; Fri,  5 May 2023 12:29:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DFE0884628
 for <cluster-devel@redhat.com>; Fri,  5 May 2023 12:29:43 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-5VRIezRsOCGwr5bps-_mTw-1; Fri, 05 May 2023 08:29:42 -0400
X-MC-Unique: 5VRIezRsOCGwr5bps-_mTw-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ece8a3e6e8so9110411cf.0
 for <cluster-devel@redhat.com>; Fri, 05 May 2023 05:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289781; x=1685881781;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Slcx5wUxYzYcA9ed7GVD8B47/DHINL2dYxrdBjgJtuY=;
 b=M0saEjZs0G6Vy7NLEt0ruLUUWRMjhcECvfJSfrzsOlQBKRecHLq5dXO3F/+5fh5gW1
 Re66BZgcuScqKqUw838ADU0X12VVoYuCK0FC3huiW0yHEKLXo732IQshoNMJdu9kqmC6
 6cvs+v5A2eQmAzWLweb5vonafWcCOZsyxwbDs5ETQ89BX++Oj6pt32IOTKuCfZBX6L5G
 v8La+Yl1BwuHlSHQCU2qAolDcW2eG3LzDUahjtuMnDLBvvSBgSMv7GarJKo1H7oqunv6
 zVWNoRt8tFWCgq8M9bknoozIqjrjI5xmII5aUyyOnsO68nHBEXcExEftLHX/iQ9OTAnf
 9QSQ==
X-Gm-Message-State: AC+VfDyYEXBuSDDDzr3kO4WVVUQafzjfpiQgBFsYwK2ZPKW/lE0ye/pZ
 CuUAsNkUXERba/c24p3NlFijdJ9kPQirrDrMGtSVAiB9Cc0Db595GBYjsSgYjefEjpYe7wUQ8Fs
 8gF1dszuKmySCz/tl1SpIfwvOOUgEUA==
X-Received: by 2002:ac8:57ce:0:b0:3e9:cb0:f7c3 with SMTP id
 w14-20020ac857ce000000b003e90cb0f7c3mr2028842qta.37.1683289781211; 
 Fri, 05 May 2023 05:29:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7l/LrPCDJ7FyFzvRN9E0xkSXkIGu/2cbeCBOMNTaeNsh2CRW1oxBLeZTAkzZ5Kabr2zZEkHQ==
X-Received: by 2002:ac8:57ce:0:b0:3e9:cb0:f7c3 with SMTP id
 w14-20020ac857ce000000b003e90cb0f7c3mr2028823qta.37.1683289780931; 
 Fri, 05 May 2023 05:29:40 -0700 (PDT)
Received: from ?IPV6:2601:883:c200:210:6ae9:ce2:24c9:b87b?
 ([2601:883:c200:210:6ae9:ce2:24c9:b87b])
 by smtp.gmail.com with ESMTPSA id
 c2-20020ae9e202000000b0074e020ff0e9sm524383qkc.50.2023.05.05.05.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 05:29:40 -0700 (PDT)
Message-ID: <7139375e-0bfa-8c66-61d7-513189909d0f@redhat.com>
Date: Fri, 5 May 2023 08:29:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Andrew Price <anprice@redhat.com>
References: <20230504174322.384715-1-rpeterso@redhat.com>
 <d388a721-fac9-3b3a-497b-9aee3aec7066@redhat.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <d388a721-fac9-3b3a-497b-9aee3aec7066@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH] gfs2: ignore rindex_update failure in
 dinode_dealloc
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andy,

On 5/5/23 3:44 AM, Andrew Price wrote:
> Hi Bob,
> 
> On 04/05/2023 18:43, Bob Peterson wrote:
>> Before this patch function gfs2_dinode_dealloc would abort if it got a
>> bad return code from gfs2_rindex_update. The problem is that it left the
>> dinode in the unlinked (not free) state, which meant subsequent fsck
>> would clean it up and flag an error. That meant some of our QE tests
>> would fail.
> 
> As I understand it the test is an interrupted rename loop workload and 
> gfs2_grow at the same time, and the bad return code is -EINTR, right?

Correct.

>> The sole purpose of gfs2_rindex_update, in this code path, is to read in
>> any newer rgrps added by gfs2_grow. But since this is a delete operation
>> it won't actually use any of those new rgrps. It can really only twiddle
>> the bits from "Unlinked" to "Free" in an existing rgrp. Therefore the
>> error should not prevent the transition from unlinked to free.
>>
>> This patch makes gfs2_dinode_dealloc ignore the bad return code and
>> proceed with freeing the dinode so the QE tests will not be tripped up.
> 
> Is it really ok to ignore all potential errors here? I wonder if it 
> should just ignore -EINTR (or whichever error the test produces) so that 
> it can still fail well for errors like -EIO.

Good question.

The call to gfs2_rindex_update is really not even needed in 
gfs2_dinode_dealloc because this is the last stage of the delete where 
we are freeing the dinode itself. I've even considered removing the call 
altogether. So to fail the operation for such an inconsequential 
action's failure seems like throwing the proverbial baby out with the 
bath water.

Maybe we should just remove the call to gfs2_rindex_update altogether 
and delegate it to earlier parts of the evict/delete process.

The original intent of calling gfs2_rindex_update in the evict/delete 
sequence was to ensure we have the newest resource groups from gfs2_grow 
because any file being evicted may have references to the new rgrps 
created by gfs2_grow that need to be freed, even if the dinode itself 
resides in an old rgrp. This is pretty much true for all parts of the 
process that evicts deleted dinodes except for gfs2_dinode_dealloc 
itself. For example, a new dinode might have an eattr, indirect block, 
data block, or whatever, in one of the new rgrps added by gfs2_grow.

However, since the inode was created/instantiated (which must be true in 
order for it to be evicted), the dinode itself must reside in a 
previously instantiated rgrp, and therefore the call to 
gfs2_rindex_update is not needed at all.

So if the call to it fails, imho, it shouldn't fail the rest of the 
gfs2_dinode_dealloc, regardless of the failure.

The next question you may ask is: why don't we get the -EINTR when 
reading in new rgrps for the purposes of deleting other parts of the 
file, its eattrs, indirect blocks, data blocks, etc.? The answer is: I 
don't know, but I suspect we have other bugs lurking in that area. I 
suspect if we try hard enough we can create other problems in which the 
punch_hole code doesn't read in new rgrps.

It may be tempting to think that this also cannot happen because the 
rgrps must also be instantiated for any eattrs, metadata, data to be 
assigned to the dinode being evicted/deleted. But that's non-clustered 
file system thinking.

In gfs2, it is possible for one cluster node to read in new rgrps from 
gfs2_grow, then assign those blocks to a new dinode that's already open 
on a different node, then delete that file, causing a second cluster 
node to evict, and try to reference those new blocks before the new 
rgrps are read in. So we need to be very careful.

We should probably spend some time trying to force these conditions to 
see if we can flush out more bugs.

For some reason, with this test, we only see this particular problem 
with gfs2_dinode_dealloc, and that's the problem I'm trying to fix with 
the patch.

Regards,

Bob Peterson

