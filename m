Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C07D5AC01F
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Sep 2022 19:38:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662226709;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=XIAWHihpR6QwqgJNOUnH9+J9hxcC7HnY/D9h72CaivA=;
	b=e9w36mfIPVDzQylAdzHLvyZV/mT41uSNe+tIov0gzMrrQVDdYzVapIIQNBbVP5qlCcrfhE
	IWmMCCVn2VUCuqI/CU1giPVwnF7EnM2/9xjsIv8r0s88zxVO+natpoebQQid2sJNSpqXBF
	Vy2vaa/BFnv+h7XWo6GWu3P/1E2T5Tk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-0EDmjM0CNmeMAV53bGTVXA-1; Sat, 03 Sep 2022 13:38:22 -0400
X-MC-Unique: 0EDmjM0CNmeMAV53bGTVXA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 904413C025BF;
	Sat,  3 Sep 2022 17:38:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85246492CA4;
	Sat,  3 Sep 2022 17:38:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 597901940342;
	Sat,  3 Sep 2022 17:38:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D70541946A42 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  3 Sep 2022 17:38:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C33A22026D64; Sat,  3 Sep 2022 17:38:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFA8F2026D4C
 for <cluster-devel@redhat.com>; Sat,  3 Sep 2022 17:38:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4BD08032FB
 for <cluster-devel@redhat.com>; Sat,  3 Sep 2022 17:38:20 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-54-PakVJ0_NMtigbKHiQOYbFg-1; Sat, 03 Sep 2022 13:38:18 -0400
X-MC-Unique: PakVJ0_NMtigbKHiQOYbFg-1
Received: by mail-lj1-f172.google.com with SMTP id by6so5216962ljb.11
 for <cluster-devel@redhat.com>; Sat, 03 Sep 2022 10:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=XIAWHihpR6QwqgJNOUnH9+J9hxcC7HnY/D9h72CaivA=;
 b=B6WpVoATvs0+Ag4nhAh2X0niGTQ65iUqkuyXs5vV6/+shse5EdBtDNfXiX+aFmWliI
 XfAKBj6c/qkDWTPTmJzr9vhgbf3Ek1iEmfMHpVyqU3ZqKdgQ5+uigYWKtP9zB5h6t2Sf
 qKp6IN1Gvc/9fh6zLhUJ7++Yun2JJMaUr1zXIYjg6uSZyH77tfcZEg8O2hWdv7J6PSne
 NbwG90Rx1t2XwyfofPX888E5zsi1JvG1if+IXYmRL6rtWs7YCV867QibN1aSzPOXRSgs
 ME9Y2UHwwjDOGay2rKWCFF7pDVyprOQvmAhUyNQkPNx1CRgWVcUFWZA+gFk+qLFKcPt/
 TAaQ==
X-Gm-Message-State: ACgBeo2AowArRIlll8iXlv2Y2g2qZ4WFWI0Qan3rhRfpMy3txYcfjsBB
 v6tAh3JwhvIHO6bj9JaoxD2EZbz3BWf2JYH+EHE=
X-Google-Smtp-Source: AA6agR40XmT8zh4h31HtNMSrlBjKkdISLmyOpZLVSDQyaRAj4ei/rdAVMIwBkrqkTVTS5Uf2en5n9Pvu5S7dwteMLrc=
X-Received: by 2002:a2e:508:0:b0:263:32c3:9a32 with SMTP id
 8-20020a2e0508000000b0026332c39a32mr9959731ljf.315.1662226697047; Sat, 03 Sep
 2022 10:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-23-vishal.moola@gmail.com>
In-Reply-To: <20220901220138.182896-23-vishal.moola@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sun, 4 Sep 2022 02:38:00 +0900
Message-ID: <CAKFNMokhm5TTVn7yGEtwchpb5rk5pur6zog-uCWZGQJmAupoVQ@mail.gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 22/23] nilfs2: Convert
 nilfs_clear_dirty_pages() to use filemap_get_folios_tag()
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 7:14 AM Vishal Moola (Oracle) wrote:
>
> Convert function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/nilfs2/page.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi

