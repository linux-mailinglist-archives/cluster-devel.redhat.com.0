Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7995A9C61
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 17:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662047978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KBfsBLjkBk+MOp0nQfi/nmYmADNsHmXsxHUoLjnY3bA=;
	b=hzHLBzs3CBAdbUI/8QEiehuF9Ke8U8qP3uPmFg5a1NGhFWyGn+iiI058Ty96nuIcyN5y9Z
	glWHLLIenKEPV1JUzSQcioJFQNx4Jvz2VyRVBh7c+Uu0PhQ+9OsNYraV6F4hPNKDJzKtKr
	/ezpTOsdglB4PXIdkfPQ78ZWiVhtld4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-LwlvPHFIOVKJr_q-KZRgeg-1; Thu, 01 Sep 2022 11:59:33 -0400
X-MC-Unique: LwlvPHFIOVKJr_q-KZRgeg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7ADB785A585;
	Thu,  1 Sep 2022 15:59:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D1681121314;
	Thu,  1 Sep 2022 15:59:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0332E1942685;
	Thu,  1 Sep 2022 15:59:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5AF561946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 15:59:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4B1F22026D64; Thu,  1 Sep 2022 15:59:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 471982026D4C
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 15:59:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CAF4801231
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 15:59:21 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-640-NEb6QiKYPf2XH93ebvihew-1; Thu,
 01 Sep 2022 11:59:15 -0400
X-MC-Unique: NEb6QiKYPf2XH93ebvihew-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6F8A321B35;
 Thu,  1 Sep 2022 15:59:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C72C13A89;
 Thu,  1 Sep 2022 15:59:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XmaNFtDWEGMSCAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Sep 2022 15:59:12 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id E1C2BA067C; Thu,  1 Sep 2022 17:59:11 +0200 (CEST)
Date: Thu, 1 Sep 2022 17:59:11 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <20220901155911.fbdsdn26kaj7ehjb@quack3>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-12-yi.zhang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220901133505.2510834-12-yi.zhang@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v2 11/14] ufs: replace ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu 01-09-22 21:35:02, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that submitting read IO if the buffer has been locked. We
> could get false positive EIO after wait_on_buffer() if the buffer has
> been locked by others. So stop using ll_rw_block() in ufs.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ufs/balloc.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ufs/balloc.c b/fs/ufs/balloc.c
> index bd810d8239f2..2436e3f82147 100644
> --- a/fs/ufs/balloc.c
> +++ b/fs/ufs/balloc.c
> @@ -295,14 +295,10 @@ static void ufs_change_blocknr(struct inode *inode, sector_t beg,
>  
>  			if (!buffer_mapped(bh))
>  					map_bh(bh, inode->i_sb, oldb + pos);
> -			if (!buffer_uptodate(bh)) {
> -				ll_rw_block(REQ_OP_READ, 1, &bh);
> -				wait_on_buffer(bh);
> -				if (!buffer_uptodate(bh)) {
> -					ufs_error(inode->i_sb, __func__,
> -						  "read of block failed\n");
> -					break;
> -				}
> +			if (bh_read(bh, 0) < 0) {
> +				ufs_error(inode->i_sb, __func__,
> +					  "read of block failed\n");
> +				break;
>  			}
>  
>  			UFSD(" change from %llu to %llu, pos %u\n",
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

