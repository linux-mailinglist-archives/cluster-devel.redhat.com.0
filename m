Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2035A7C0D
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 13:16:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661944564;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=oXzaBEvTVV7dbi9myeynRQQFCXVdxVJKtZqX81xMy8k=;
	b=Bj8aHdzYhCnGjLdKFGqJu0Hw+0nUgtvzINJ2BI7BGKJW1NyaW8HqLcVksvOoev0Fr/EzYd
	wUzj5+L5KhMP3aABNzIiLAJOG9j/rms9lQv40oB0HUbTdbVQhIBD/gtatsznZhtdqoPPAl
	TuLlzD1hwissiwrd0CrIZwx/uFs4xJQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-6RZe3aacO_GPxtRHX6383A-1; Wed, 31 Aug 2022 07:15:59 -0400
X-MC-Unique: 6RZe3aacO_GPxtRHX6383A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D67E6185A7B2;
	Wed, 31 Aug 2022 11:15:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7509F492C3B;
	Wed, 31 Aug 2022 11:15:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5A3AB1946A4B;
	Wed, 31 Aug 2022 11:15:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E91F1946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 11:15:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EA90340315A; Wed, 31 Aug 2022 11:15:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5BFF403350
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 11:15:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB7FA185A7B2
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 11:15:56 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-347-ddqZbaW7NaePYqNxMoroKg-1; Wed,
 31 Aug 2022 07:15:53 -0400
X-MC-Unique: ddqZbaW7NaePYqNxMoroKg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D059A1F924;
 Wed, 31 Aug 2022 11:15:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF37013A7C;
 Wed, 31 Aug 2022 11:15:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oOq5KudCD2NueAAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 31 Aug 2022 11:15:51 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 2254CA067B; Wed, 31 Aug 2022 13:15:51 +0200 (CEST)
Date: Wed, 31 Aug 2022 13:15:51 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220831111551.pjrcx2ld6wm5trct@quack3>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-14-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220831072111.3569680-14-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 13/14] ext2: replace bh_submit_read()
 helper with bh_read_locked()
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
 ntfs3@lists.linux.dev, jack@suse.cz, chengzhihao1@huawei.com, mark@fasheh.com,
 linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 cluster-devel@redhat.com, viro@zeniv.linux.org.uk, yukuai3@huawei.com,
 linux-fsdevel@vger.kernel.org, tytso@mit.edu, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, dushistov@mail.ru, ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 31-08-22 15:21:10, Zhang Yi wrote:
> bh_submit_read() is almost the same as bh_read_locked(), switch to use
> bh_read_locked() in read_block_bitmap(), prepare remove the old one.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
...
> diff --git a/fs/ext2/balloc.c b/fs/ext2/balloc.c
> index c17ccc19b938..548a1d607f5a 100644
> --- a/fs/ext2/balloc.c
> +++ b/fs/ext2/balloc.c
> @@ -142,7 +142,7 @@ read_block_bitmap(struct super_block *sb, unsigned int block_group)
>  	if (likely(bh_uptodate_or_lock(bh)))
>  		return bh;
>  
> -	if (bh_submit_read(bh) < 0) {
> +	if (bh_read_locked(bh, 0) < 0) {

I would just use bh_read() here and thus remove a bit more of the
boilerplate code (like the bh_uptodate_or_lock() checking).

							Honza

>  		brelse(bh);
>  		ext2_error(sb, __func__,
>  			    "Cannot read block bitmap - "
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

