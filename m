Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2DD6B34F6
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 04:47:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678420075;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4xyGJsOjRJLpNas7QLsSzswp9dZYt/CBz8OLBU9HUP4=;
	b=UEPM/wJCUL9C19BHinsf6vC9CRRKj8xns8Ay2ej5PmrKSBmXhmyfJuu0zlA9Ikh3HGqThc
	nRp2jtwjPtC49zzmklPqvmZzzlpCHxx70+o9WS/C2H5aPFtKn/rgWJvUjGAz3KZC/1iFjs
	RTLeIlgNNEbgLJNb7UfU8EIedkZZvQA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-ftE0r-sGOQ2H3J3Erg_BKQ-1; Thu, 09 Mar 2023 22:47:52 -0500
X-MC-Unique: ftE0r-sGOQ2H3J3Erg_BKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 705B5185A7A4;
	Fri, 10 Mar 2023 03:47:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2154240C83B6;
	Fri, 10 Mar 2023 03:47:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EBE661946A49;
	Fri, 10 Mar 2023 03:47:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2956B1946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 03:47:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 089CA2166B2A; Fri, 10 Mar 2023 03:47:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 019752166B26
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 03:47:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5C19811E9C
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 03:47:49 +0000 (UTC)
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-83-OMfIitZNO7SOzaBXz1jyNg-1; Thu, 09 Mar 2023 22:47:44 -0500
X-MC-Unique: OMfIitZNO7SOzaBXz1jyNg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=20; SR=0;
 TI=SMTPD_---0VdVeWEX_1678420058
Received: from 30.97.48.46(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VdVeWEX_1678420058) by smtp.aliyun-inc.com;
 Fri, 10 Mar 2023 11:47:39 +0800
Message-ID: <24a46ae8-6e50-2f45-f099-45743bb013c4@linux.alibaba.com>
Date: Fri, 10 Mar 2023 11:47:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Al Viro <viro@zeniv.linux.org.uk>, Yangtao Li <frank.li@vivo.com>
References: <20230309152127.41427-1-frank.li@vivo.com>
 <20230309152127.41427-2-frank.li@vivo.com> <20230310031547.GD3390869@ZenIV>
 <2fa31829-03f0-7bfb-a89b-e3917c479733@linux.alibaba.com>
In-Reply-To: <2fa31829-03f0-7bfb-a89b-e3917c479733@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v3 2/6] erofs: convert to use
 i_blockmask()
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
Cc: brauner@kernel.org, tytso@mit.edu, joseph.qi@linux.alibaba.com,
 mark@fasheh.com, chao@kernel.org, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, huyue2@coolpad.com, adilger.kernel@dilger.ca,
 jlbec@evilplan.org, jefflexu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 xiang@kernel.org, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/3/10 11:42, Gao Xiang wrote:
> Hi Al,
> 
> On 2023/3/10 11:15, Al Viro wrote:
>> On Thu, Mar 09, 2023 at 11:21:23PM +0800, Yangtao Li wrote:
>>> Use i_blockmask() to simplify code.
>>
>> Umm...  What's the branchpoint for that series?  Not the mainline -
>> there we have i_blocksize() open-coded...
> 
> Actually Yue Hu sent out a clean-up patch and I applied to -next for
> almost a week and will be upstreamed for 6.3-rc2:
> 
> https://lore.kernel.org/r/a238dca1-256f-ae2f-4a33-e54861fe4ffb@kernel.org/T/#t

Sorry this link:
https://lore.kernel.org/r/0261de31-e98b-85cd-80de-96af5a76e15c@linux.alibaba.com

Yangtao's suggestion was to use GENMASK, and I'm not sure it's a good way
since (i_blocksize(inode) - 1) is simple enough, and then it becomes like
this.

Thanks,
Gao Xiang


> 
> And then Yangtao would like to wrap this as a new VFS helper, I'm not
> sure why it's necessary since it doesn't save a lot but anyway, I'm open
> to it if VFS could have such new helper.
> 
> Thanks,
> Gao Xiang
> 
>>
>>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>>> ---
>>> v3:
>>> -none
>>> v2:
>>> -convert to i_blockmask()
>>>   fs/erofs/data.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
>>> index 7e8baf56faa5..e9d1869cd4b3 100644
>>> --- a/fs/erofs/data.c
>>> +++ b/fs/erofs/data.c
>>> @@ -380,7 +380,7 @@ static ssize_t erofs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>>>           if (bdev)
>>>               blksize_mask = bdev_logical_block_size(bdev) - 1;
>>>           else
>>> -            blksize_mask = i_blocksize(inode) - 1;
>>> +            blksize_mask = i_blockmask(inode);
>>>           if ((iocb->ki_pos | iov_iter_count(to) |
>>>                iov_iter_alignment(to)) & blksize_mask)
>>> -- 
>>> 2.25.1
>>>

