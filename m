Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B685AC017
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Sep 2022 19:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662226697;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=umA9pNWUzA7jidUk20/rQkICnueDyRo/bSzQh0Un5OQ=;
	b=PFMUh8cJgSuA8iiMv1dZu7eOtsKqA1jzFK0jxPP1defDFbb5GOiZAeRzcBijudgTcRT+KZ
	8QaoEtS74N1Qu7T/4Jpy0dNAs7v5GnLSQ+3RN4APW/Fz7sA53hyIrYKy0iZkP/UQ52l8lh
	Z5gHdt/dpv59SmW08v+lwyqu8EoskGU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-MYuwBTNrN4-HTmjIO4kMYA-1; Sat, 03 Sep 2022 13:38:12 -0400
X-MC-Unique: MYuwBTNrN4-HTmjIO4kMYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08B7F380673B;
	Sat,  3 Sep 2022 17:38:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F01EDC15BB3;
	Sat,  3 Sep 2022 17:38:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D338F1940342;
	Sat,  3 Sep 2022 17:38:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 79B941946A42 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  3 Sep 2022 17:38:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4E8E82166B2A; Sat,  3 Sep 2022 17:38:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C0D82166B26
 for <cluster-devel@redhat.com>; Sat,  3 Sep 2022 17:38:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5456801755
 for <cluster-devel@redhat.com>; Sat,  3 Sep 2022 17:38:09 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-416-s7J-WqRTMKy2B07x5yg5TQ-1; Sat, 03 Sep 2022 13:38:08 -0400
X-MC-Unique: s7J-WqRTMKy2B07x5yg5TQ-1
Received: by mail-lf1-f51.google.com with SMTP id g7so7515110lfe.11
 for <cluster-devel@redhat.com>; Sat, 03 Sep 2022 10:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=umA9pNWUzA7jidUk20/rQkICnueDyRo/bSzQh0Un5OQ=;
 b=AhM+2mzqght0OUVXo8R5JS962nQ4+eRiA2vFEBu0tznrs/pnfRbCGIVPKI6RWP6KId
 JIh06ykWr0/O30PJjM8bO2njHhglbLZdpBWVlAK75oHb8hnADhu16MvpehzTKbhdkJNs
 ws40PCrrDksDAtPbAmDWyg0JVLUnzbmsuwb8xMId4qB+aeb1FY6QuEgwta8iADvFY6Ib
 gLRMyLt2ulyQcWSIMX2VH25Gf2DU4mzFWnzHdydgVUibutwZfNxybvnvaBGhTbq0MZYD
 w4vLCz2HivIxfng3sVBRTHPgH4ztjEoMlhC63IwI5fz1+Epd452cO1x2b9KSHOGucQ4o
 4UDg==
X-Gm-Message-State: ACgBeo2DSGUon/cDA0x3OPBMf30w1DaPHqSt3t7/w/J7ch0erM9LpT5/
 QRXRPEzH8u7o2Y3ok+bipPt8cEAAI8SRh85SNTM=
X-Google-Smtp-Source: AA6agR7Hs/+xwEowwLQe+sf+am2LMCCYbskcPVWg25l+bwBfAQC13YuN5kobnm2fSunCnRskcOjFYam9DiwtSafspBg=
X-Received: by 2002:ac2:5510:0:b0:495:3773:f9fe with SMTP id
 j16-20020ac25510000000b004953773f9femr748646lfk.65.1662226686593; Sat, 03 Sep
 2022 10:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-21-vishal.moola@gmail.com>
In-Reply-To: <20220901220138.182896-21-vishal.moola@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sun, 4 Sep 2022 02:37:49 +0900
Message-ID: <CAKFNMo=TxJf=47DCnsscu7ZZuDNVi1LDoDHYZo_XscOSzOfi_g@mail.gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 20/23] nilfs2: Convert
 nilfs_btree_lookup_dirty_buffers() to use filemap_get_folios_tag()
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
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 7:06 AM Vishal Moola (Oracle) wrote:
>
> Convert function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/nilfs2/btree.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi

