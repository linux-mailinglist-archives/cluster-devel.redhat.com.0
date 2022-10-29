Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0318A612044
	for <lists+cluster-devel@lfdr.de>; Sat, 29 Oct 2022 06:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667019204;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xK0Gix4Nng4+bxsJBxIBs/C47KThO3x8jttgKijokEw=;
	b=KNAHSC7cgO5jQObmLNQdUuQyzSWGv/KwbA8BXlvkVoXZTE8Aeq2hht8EaRXsKMpoliJ9/I
	zdWBqmIJMyHbK2Xl3OlXtU/K/nMTO7gZZRI2UkTndhdbgNQ0xrwcBs3wgLEwf0cWGBKSxK
	KJUMe7GLGTxUpr0A9xyJgSb6mtqxwgE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-IkwZJjhLOfqAWJqX8MCAyw-1; Sat, 29 Oct 2022 00:53:20 -0400
X-MC-Unique: IkwZJjhLOfqAWJqX8MCAyw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F64629A8AFB;
	Sat, 29 Oct 2022 04:53:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C822E492B04;
	Sat, 29 Oct 2022 04:53:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 54F6E19466DF;
	Sat, 29 Oct 2022 04:53:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E654D1946586 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 29 Oct 2022 04:52:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8D5D4200BA65; Sat, 29 Oct 2022 04:52:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85A1A2027062
 for <cluster-devel@redhat.com>; Sat, 29 Oct 2022 04:52:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66BC8185A78B
 for <cluster-devel@redhat.com>; Sat, 29 Oct 2022 04:52:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-EAFol-W1Mr-Yq2_w_7X3RA-1; Sat, 29 Oct 2022 00:52:57 -0400
X-MC-Unique: EAFol-W1Mr-Yq2_w_7X3RA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81D3160A67;
 Sat, 29 Oct 2022 04:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968C2C433D6;
 Sat, 29 Oct 2022 04:46:19 +0000 (UTC)
Message-ID: <cee7fa24-5699-9777-d157-f03a8dd18a00@kernel.org>
Date: Sat, 29 Oct 2022 12:46:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-12-vishal.moola@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221017202451.4951-12-vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [f2fs-dev] [PATCH v3 11/23] f2fs: Convert
 f2fs_fsync_node_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/10/18 4:24, Vishal Moola (Oracle) wrote:
> Convert function to use a folio_batch instead of pagevec. This is in
> preparation for the removal of find_get_pages_range_tag().
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>   fs/f2fs/node.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 983572f23896..e8b72336c096 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1728,12 +1728,12 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   			unsigned int *seq_id)
>   {
>   	pgoff_t index;
> -	struct pagevec pvec;
> +	struct folio_batch fbatch;
>   	int ret = 0;
>   	struct page *last_page = NULL;
>   	bool marked = false;
>   	nid_t ino = inode->i_ino;
> -	int nr_pages;
> +	int nr_folios;
>   	int nwritten = 0;
>   
>   	if (atomic) {
> @@ -1742,20 +1742,21 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   			return PTR_ERR_OR_ZERO(last_page);
>   	}
>   retry:
> -	pagevec_init(&pvec);
> +	folio_batch_init(&fbatch);
>   	index = 0;
>   
> -	while ((nr_pages = pagevec_lookup_tag(&pvec, NODE_MAPPING(sbi), &index,
> -				PAGECACHE_TAG_DIRTY))) {
> +	while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
> +					(pgoff_t)-1, PAGECACHE_TAG_DIRTY,
> +					&fbatch))) {
>   		int i;
>   
> -		for (i = 0; i < nr_pages; i++) {
> -			struct page *page = pvec.pages[i];
> +		for (i = 0; i < nr_folios; i++) {
> +			struct page *page = &fbatch.folios[i]->page;
>   			bool submitted = false;
>   
>   			if (unlikely(f2fs_cp_error(sbi))) {
>   				f2fs_put_page(last_page, 0);
> -				pagevec_release(&pvec);
> +				folio_batch_release(&fbatch);
>   				ret = -EIO;
>   				goto out;
>   			}
> @@ -1821,7 +1822,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   				break;
>   			}
>   		}
> -		pagevec_release(&pvec);
> +		folio_batch_release(&fbatch);
>   		cond_resched();
>   
>   		if (ret || marked)

