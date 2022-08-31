Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6E25A80A6
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 16:53:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661957605;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WWul1WbOj+CoM0VW3Mvy8IXVhauGgXc4/hVxxU13Dbk=;
	b=WMu0ZcUA+eTh1Hr5DW+hWXG0/5AzbepZ5giWWhoGGdZEyuvrcCLxSqDDNW1/l8/i41FUj5
	Et3mcr7d1TaWUIJBfS6w7QFIuAplcxd6nASFHnrc1aK435vAG9qwb/LL6m+BH/w2WPCayW
	88GmrYPtitoiCdRigYQY1eVgJRUHcf4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-3myJ0vrzOr-jjrbDEfglsQ-1; Wed, 31 Aug 2022 10:53:23 -0400
X-MC-Unique: 3myJ0vrzOr-jjrbDEfglsQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F32333C0ED4D;
	Wed, 31 Aug 2022 14:53:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06A9840B40C7;
	Wed, 31 Aug 2022 14:53:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C40151946A4B;
	Wed, 31 Aug 2022 14:53:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 449801946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 13:11:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 34CFC2166B2A; Wed, 31 Aug 2022 13:11:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 313472166B26
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 13:11:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15E0285A59C
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 13:11:48 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com
 [45.249.212.189]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-LQhkJKr-OzG6lM_luG5Fkw-1; Wed, 31 Aug 2022 09:11:43 -0400
X-MC-Unique: LQhkJKr-OzG6lM_luG5Fkw-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MHkzg3p9pzHnY6;
 Wed, 31 Aug 2022 21:09:51 +0800 (CST)
Received: from [10.174.178.134] (10.174.178.134) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 31 Aug 2022 21:11:38 +0800
To: Jan Kara <jack@suse.cz>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-3-yi.zhang@huawei.com>
 <20220831113029.fsywbjzk4qw24qdc@quack3>
From: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <df2738e4-493f-0dfd-95c4-b5f763561c63@huawei.com>
Date: Wed, 31 Aug 2022 21:11:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20220831113029.fsywbjzk4qw24qdc@quack3>
X-Originating-IP: [10.174.178.134]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 02/14] fs/buffer: add some new buffer
 read helpers
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
Cc: axboe@kernel.dk, almaz.alexandrovich@paragon-software.com,
 ntfs3@lists.linux.dev, tytso@mit.edu, mark@fasheh.com,
 linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 cluster-devel@redhat.com, viro@zeniv.linux.org.uk, yukuai3@huawei.com,
 linux-fsdevel@vger.kernel.org, dushistov@mail.ru, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, chengzhihao1@huawei.com,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Thanks for the review and suggestions.

On 2022/8/31 19:30, Jan Kara wrote:
> On Wed 31-08-22 15:20:59, Zhang Yi wrote:
>> Current ll_rw_block() helper is fragile because it assumes that locked
>> buffer means it's under IO which is submitted by some other who hold
>> the lock, it skip buffer if it failed to get the lock, so it's only
>> safe on the readahead path. Unfortunately, now that most filesystems
>> still use this helper mistakenly on the sync metadata read path. There
>> is no guarantee that the one who hold the buffer lock always submit IO
>> (e.g. buffer_migrate_folio_norefs() after commit 88dbcbb3a484 ("blkdev:
>> avoid migration stalls for blkdev pages"), it could lead to false
>> positive -EIO when submitting reading IO.
>>
>> This patch add some friendly buffer read helpers to prepare replace
>> ll_rw_block() and similar calls. We can only call bh_readahead_[]
>> helpers for the readahead paths.
>>
>> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> 
> This looks mostly good. Just a few small nits below.
> 
[..]
>> diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
>> index c3863c417b00..8a01c07c0418 100644
>> --- a/include/linux/buffer_head.h
>> +++ b/include/linux/buffer_head.h
[..]
>> +static inline void bh_read_nowait(struct buffer_head *bh, blk_opf_t op_flags)
>> +{
>> +	lock_buffer(bh);
>> +	__bh_read(bh, op_flags, false);
>> +}
>> +
>> +static inline int bh_read(struct buffer_head *bh, blk_opf_t op_flags)
>> +{
>> +	lock_buffer(bh);
>> +	return __bh_read(bh, op_flags, true);
>> +}
> 
> I would use bh_uptodate_or_lock() helper in the above two functions to
> avoid locking the buffer in case it is already uptodate.
> 
Yes, it's a good point, it seems we could also remove "if (!buffer_uptodate(bh))"
before above two helpers in the latter patches, like in fs/jbd2/journal.c.

@@ -1893,15 +1893,14 @@ static int journal_get_superblock(journal_t *journal)
 {
 	struct buffer_head *bh;
 	journal_superblock_t *sb;
-	int err = -EIO;
+	int err;

 	bh = journal->j_sb_buffer;

 	J_ASSERT(bh != NULL);
- 	if (!buffer_uptodate(bh)) {
-		ll_rw_block(REQ_OP_READ, 1, &bh);
-		wait_on_buffer(bh);
-		if (!buffer_uptodate(bh)) {
+	err = bh_read(bh, 0);
+	if (err) {
-			printk(KERN_ERR
-				"JBD2: IO error reading journal superblock\n");
-			goto out;
+		printk(KERN_ERR
+			"JBD2: IO error reading journal superblock\n");
+		goto out;
...

Thanks,
Yi.

