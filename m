Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D391C6492AB
	for <lists+cluster-devel@lfdr.de>; Sun, 11 Dec 2022 07:09:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670738983;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1EnAx1geRWwCfFzlBGrx4cqIztH4USU76VYUhrnSf9o=;
	b=M8WfB/i/oq2NkddltYYaa3DPzmotHIMEchYNzGHeV68DE6gJqR5ODz8jvC2cMSEIYu/bSK
	YQPIt7zWta3C+IbONzFC9hExRQ6qD9JC8jm83vkS0LWoVgtj6KIrqt8L/86Oed/k+l38Wu
	EfPO9lp64a4jgcVMPwCWXchpQbohCG4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-fs69ZzHIPuyYUYg3i16_cw-1; Sun, 11 Dec 2022 01:09:32 -0500
X-MC-Unique: fs69ZzHIPuyYUYg3i16_cw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC03185A59D;
	Sun, 11 Dec 2022 06:09:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCDC340C2065;
	Sun, 11 Dec 2022 06:09:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A7D051947063;
	Sun, 11 Dec 2022 06:09:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 355B31947060 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 11 Dec 2022 06:09:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6B716492CA4; Sun, 11 Dec 2022 06:09:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63B5F492CA2
 for <cluster-devel@redhat.com>; Sun, 11 Dec 2022 06:09:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48D0A8027EC
 for <cluster-devel@redhat.com>; Sun, 11 Dec 2022 06:09:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-j12PswLkPbO7-zhpl_hGsQ-1; Sun, 11 Dec 2022 01:09:15 -0500
X-MC-Unique: j12PswLkPbO7-zhpl_hGsQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61B2F60C99;
 Sun, 11 Dec 2022 06:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34B2C433D2;
 Sun, 11 Dec 2022 06:03:59 +0000 (UTC)
Message-ID: <489f2daa-4559-6c32-71e2-8bab65fb8154@kernel.org>
Date: Sun, 11 Dec 2022 14:03:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org
References: <20221102161031.5820-1-vishal.moola@gmail.com>
 <20221102161031.5820-17-vishal.moola@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221102161031.5820-17-vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [f2fs-dev] [PATCH v4 16/23] f2fs: Convert
 f2fs_sync_meta_pages() to use filemap_get_folios_tag()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/11/3 0:10, Vishal Moola (Oracle) wrote:
> Convert function to use folios throughout. This is in preparation for the
> removal of find_get_pages_range_tag(). This change removes 5 calls to
> compound_head().
> 
> Initially the function was checking if the previous page index is truly the
> previous page i.e. 1 index behind the current page. To convert to folios and
> maintain this check we need to make the check
> folio->index != prev + folio_nr_pages(previous folio) since we don't know
> how many pages are in a folio.
> 
> At index i == 0 the check is guaranteed to succeed, so to workaround indexing
> bounds we can simply ignore the check for that specific index. This makes the
> initial assignment of prev trivial, so I removed that as well.
> 
> Also modified a comment in commit_checkpoint for consistency.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Chao Yu <chao@kernel.org>

Thanks,

