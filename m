Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B41C464929E
	for <lists+cluster-devel@lfdr.de>; Sun, 11 Dec 2022 07:02:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670738554;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E3iH//lN9j/DlSYhxZrL2nzU/x07WF0rbkFjVtSy4qo=;
	b=TNioqzAxhVSRKIJ+Fax0ZHcmj/zBCNzjAnnHTp+y/XVQcvdCrxEIYh7XBDWFtHP6Jb4g3x
	LXyxM9pj87M+K61OcMb6WEijIkd4YSa8T8zo5CMxH4WmwtUt/TUDJbf+qgBqmIOM4Hr8Vi
	KlAdSvPgmF8Nc6M1FZVQTSZvJR/fsjs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118--jHqPOW4PdK63TF0Wh86Uw-1; Sun, 11 Dec 2022 01:02:31 -0500
X-MC-Unique: -jHqPOW4PdK63TF0Wh86Uw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53C2D805AC6;
	Sun, 11 Dec 2022 06:02:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA4721121333;
	Sun, 11 Dec 2022 06:02:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1B6151947063;
	Sun, 11 Dec 2022 06:02:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7C8AA1947060 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 11 Dec 2022 06:02:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 16E4F492B05; Sun, 11 Dec 2022 06:02:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FBE9492B04
 for <cluster-devel@redhat.com>; Sun, 11 Dec 2022 06:02:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6DFD3C01E07
 for <cluster-devel@redhat.com>; Sun, 11 Dec 2022 06:02:24 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-r0qXBYL7MN2nGEBQC_QFRg-1; Sun, 11 Dec 2022 01:02:23 -0500
X-MC-Unique: r0qXBYL7MN2nGEBQC_QFRg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF276B80945;
 Sun, 11 Dec 2022 05:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD88EC433EF;
 Sun, 11 Dec 2022 05:54:51 +0000 (UTC)
Message-ID: <38c34b59-bf57-4eb8-b74b-8b387b792cb8@kernel.org>
Date: Sun, 11 Dec 2022 13:54:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org
References: <20221102161031.5820-1-vishal.moola@gmail.com>
 <20221102161031.5820-16-vishal.moola@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221102161031.5820-16-vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [f2fs-dev] [PATCH v4 15/23] f2fs: Convert
 last_fsync_dnode() to use filemap_get_folios_tag()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/11/3 0:10, Vishal Moola (Oracle) wrote:
> Convert to use a folio_batch instead of pagevec. This is in preparation for
> the removal of find_get_pages_range_tag().
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Chao Yu <chao@kernel.org>

Thanks,

