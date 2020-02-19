Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 68D8A16391F
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 02:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582074804;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=169bBczyyFHIG/Q8UwlECaKiABa8QJEvrDhzzb+cU00=;
	b=BuD8W30BD2pHAXmS6RcKcRMJNh8D5JRpWNR3WxL7DlwDu/NYUVJSTBVSUpohuYvSgypp3j
	xLtiGl1SEepkkZhzb+KTM8JCDPORGOHznqau+Ozt90TmEv9cWfPke4r/Rkh30T7YLQIMbY
	NSNZJfLO2c/OiZDgSmxSXDh4GTjMWv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-LaGEUHfaOJ-ye98xOaxlLQ-1; Tue, 18 Feb 2020 20:13:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 653918017DF;
	Wed, 19 Feb 2020 01:13:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A78CB60C80;
	Wed, 19 Feb 2020 01:13:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F24435AF5;
	Wed, 19 Feb 2020 01:13:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J1DF2w032281 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 20:13:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7C9422063209; Wed, 19 Feb 2020 01:13:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 778A72026D69
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 01:13:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 008E38012A6
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 01:13:13 +0000 (UTC)
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
	[216.228.121.143]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-169-lNKvI9edNfuDtLTnJylr1Q-1; Tue, 18 Feb 2020 20:13:10 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4c8b5e0000>; Tue, 18 Feb 2020 17:11:58 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Tue, 18 Feb 2020 17:13:09 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Tue, 18 Feb 2020 17:13:09 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 19 Feb 2020 01:13:09 +0000
To: Matthew Wilcox <willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-12-willy@infradead.org>
	<e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
	<20200219010209.GI24185@bombadil.infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <61bcaa87-91b2-857b-350a-86dab81a1f13@nvidia.com>
Date: Tue, 18 Feb 2020 17:13:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219010209.GI24185@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: lNKvI9edNfuDtLTnJylr1Q-1
X-MC-Unique: LaGEUHfaOJ-ye98xOaxlLQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 07/19] mm: Put readahead pages in
	cache earlier
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/18/20 5:02 PM, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 04:01:43PM -0800, John Hubbard wrote:
>> How about this instead? It uses the "for" loop fully and more naturally,
>> and is easier to read. And it does the same thing:
>>
>> static inline struct page *readahead_page(struct readahead_control *rac)
>> {
>> 	struct page *page;
>>
>> 	if (!rac->_nr_pages)
>> 		return NULL;
>>
>> 	page = xa_load(&rac->mapping->i_pages, rac->_start);
>> 	VM_BUG_ON_PAGE(!PageLocked(page), page);
>> 	rac->_batch_count = hpage_nr_pages(page);
>>
>> 	return page;
>> }
>>
>> static inline struct page *readahead_next(struct readahead_control *rac)
>> {
>> 	rac->_nr_pages -= rac->_batch_count;
>> 	rac->_start += rac->_batch_count;
>>
>> 	return readahead_page(rac);
>> }
>>
>> #define readahead_for_each(rac, page)			\
>> 	for (page = readahead_page(rac); page != NULL;	\
>> 	     page = readahead_page(rac))
> 
> I'm assuming you mean 'page = readahead_next(rac)' on that second line.


Yep. :)


> 
> If you keep reading all the way to the penultimate patch, it won't work
> for iomap ... at least not in the same way.
> 

OK, getting there...


thanks,
-- 
John Hubbard
NVIDIA

