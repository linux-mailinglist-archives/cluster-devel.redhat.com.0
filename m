Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA391687A1
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Feb 2020 20:44:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582314294;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pQKOwwEmNmp5lZ+eX1Ols5QNnW+OORTLQJDMCsPxtEc=;
	b=F7cVEz8vXEvnBN/an/voekd3pQx+oesqemBkecTb2odK6gTVAHLdh1GSFpqO1Zglqo0CR+
	q0oMEUHvVBC74FZK33Ib0ywBZ3rmgnXuy4c2JKSD+wXO+Z0EkgQ6H4jgBr27LxvlYlrjW5
	Z8VfiQ6U0JhBID5YsdpyuBchwsu5WJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-_KW576rANpS7z_gN4sDV1A-1; Fri, 21 Feb 2020 14:44:52 -0500
X-MC-Unique: _KW576rANpS7z_gN4sDV1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D33A9DBB3;
	Fri, 21 Feb 2020 19:44:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1F47909E2;
	Fri, 21 Feb 2020 19:44:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96048860C2;
	Fri, 21 Feb 2020 19:44:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01LJicJO022085 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 14:44:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 34D062063FE5; Fri, 21 Feb 2020 19:44:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F3F12063FEA
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 19:44:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A5B8800FC6
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 19:44:36 +0000 (UTC)
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
	[216.228.121.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-474-R5-rGD3lOnm4QKcqScwq5g-1; Fri, 21 Feb 2020 14:44:33 -0500
X-MC-Unique: R5-rGD3lOnm4QKcqScwq5g-1
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e5033120000>; Fri, 21 Feb 2020 11:44:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Fri, 21 Feb 2020 11:44:32 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Fri, 21 Feb 2020 11:44:32 -0800
Received: from [10.2.166.200] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 21 Feb 2020 19:44:32 +0000
To: Matthew Wilcox <willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-12-willy@infradead.org>
	<e6ef2075-b849-299e-0f11-c6ee82b0a3c7@nvidia.com>
	<20200221153537.GE24185@bombadil.infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <1fd052ce-cd5e-60ce-e494-cbf6427d3ed3@nvidia.com>
Date: Fri, 21 Feb 2020 11:41:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221153537.GE24185@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 11/24] mm: Move end_index check out
	of readahead loop
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/21/20 7:35 AM, Matthew Wilcox wrote:
> On Thu, Feb 20, 2020 at 07:50:39PM -0800, John Hubbard wrote:
>> This tiny patch made me pause, because I wasn't sure at first of the exact
>> intent of the lines above. Once I worked it out, it seemed like it might
>> be helpful (or overkill??) to add a few hints for the reader, especially since
>> there are no hints in the function's (minimal) documentation header. What
>> do you think of this?
>>
>> 	/*
>> 	 * If we can't read *any* pages without going past the inodes's isize
>> 	 * limit, give up entirely:
>> 	 */
>> 	if (index > end_index)
>> 		return;
>>
>> 	/* Cap nr_to_read, in order to avoid overflowing the ULONG type: */
>> 	if (index + nr_to_read < index)
>> 		nr_to_read = ULONG_MAX - index + 1;
>>
>> 	/* Cap nr_to_read, to avoid reading past the inode's isize limit: */
>> 	if (index + nr_to_read >= end_index)
>> 		nr_to_read = end_index - index + 1;
> 
> A little verbose for my taste ... How about this?


Mine too, actually. :)  I think your version below looks good.


thanks,
-- 
John Hubbard
NVIDIA

> 
>          end_index = (isize - 1) >> PAGE_SHIFT;
>          if (index > end_index)
>                  return;
>          /* Avoid wrapping to the beginning of the file */
>          if (index + nr_to_read < index)
>                  nr_to_read = ULONG_MAX - index + 1;
>          /* Don't read past the page containing the last byte of the file */
>          if (index + nr_to_read >= end_index)
>                  nr_to_read = end_index - index + 1;
> 

