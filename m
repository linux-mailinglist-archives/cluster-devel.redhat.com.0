Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B13C0612046
	for <lists+cluster-devel@lfdr.de>; Sat, 29 Oct 2022 06:55:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667019332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KUOB99+eNFVZwcGV53fgw8ytEoA1O6w5bQdwqcMTdN8=;
	b=XsJNJ5cuCl2hlonY17vQbhUPzozO08Vx2AWFcJxysPKpVAKp7WYSCCzYKKGg7oewGTERDy
	aSQ5e2x7IynbGk5yj8x2aQO8A/Lv9scz+PZSERtJiRLUIdFnnj00puNOiokG7JSeOxDD3B
	yUT7owlQMas46aiXKelI8NyAOGwtsWM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-zkDVJvDMPIatpVXL6cu6rw-1; Sat, 29 Oct 2022 00:55:29 -0400
X-MC-Unique: zkDVJvDMPIatpVXL6cu6rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE53A1C05AC0;
	Sat, 29 Oct 2022 04:55:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C349740C6EC3;
	Sat, 29 Oct 2022 04:55:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C39219466DF;
	Sat, 29 Oct 2022 04:55:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 89CC41946586 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 29 Oct 2022 04:55:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F66C111E407; Sat, 29 Oct 2022 04:55:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18A531121314
 for <cluster-devel@redhat.com>; Sat, 29 Oct 2022 04:55:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE5BB29AA2FD
 for <cluster-devel@redhat.com>; Sat, 29 Oct 2022 04:55:25 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-ve-TLbzZPgSs2ThqJT4mdw-1; Sat, 29 Oct 2022 00:55:24 -0400
X-MC-Unique: ve-TLbzZPgSs2ThqJT4mdw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 64967CE2FCF;
 Sat, 29 Oct 2022 04:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA46BC433C1;
 Sat, 29 Oct 2022 04:47:29 +0000 (UTC)
Message-ID: <80fe1f37-586b-4fc6-f007-1d3e8ec3fdb9@kernel.org>
Date: Sat, 29 Oct 2022 12:47:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-14-vishal.moola@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221017202451.4951-14-vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [f2fs-dev] [PATCH v3 13/23] f2fs: Convert
 f2fs_sync_node_pages() to use filemap_get_folios_tag()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
>   fs/f2fs/node.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index a2f477cc48c7..38f32b4d61dc 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1935,23 +1935,24 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>   				bool do_balance, enum iostat_type io_type)
>   {
>   	pgoff_t index;
> -	struct pagevec pvec;
> +	struct folio_batch fbatch;
>   	int step = 0;
>   	int nwritten = 0;
>   	int ret = 0;
> -	int nr_pages, done = 0;
> +	int nr_folios, done = 0;
>   
> -	pagevec_init(&pvec);
> +	folio_batch_init(&fbatch);
>   
>   next_step:
>   	index = 0;
>   
> -	while (!done && (nr_pages = pagevec_lookup_tag(&pvec,
> -			NODE_MAPPING(sbi), &index, PAGECACHE_TAG_DIRTY))) {
> +	while (!done && (nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi),
> +				&index, (pgoff_t)-1, PAGECACHE_TAG_DIRTY,
> +				&fbatch))) {
>   		int i;
>   
> -		for (i = 0; i < nr_pages; i++) {
> -			struct page *page = pvec.pages[i];
> +		for (i = 0; i < nr_folios; i++) {
> +			struct page *page = &fbatch.folios[i]->page;
>   			bool submitted = false;
>   
>   			/* give a priority to WB_SYNC threads */
> @@ -2026,7 +2027,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>   			if (--wbc->nr_to_write == 0)
>   				break;
>   		}
> -		pagevec_release(&pvec);
> +		folio_batch_release(&fbatch);
>   		cond_resched();
>   
>   		if (wbc->nr_to_write == 0) {

