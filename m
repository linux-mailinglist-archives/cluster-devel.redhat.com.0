Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D61A5AC016
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Sep 2022 19:38:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662226698;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Z1VGvcyPcxaVL7OhRrzeu9KO4THMsdUZs/+YFm2RijY=;
	b=dnSUw8o2+L72zols/2txfuwZHuTp7bsItdmizh1RapLo+44Huk0JEYAd0cG7w4/z2W1x4d
	f0smPpDY7drVLMJTTWOPum4OZrX+8ZGr4RPqaY7ijmtYYooIXvBLRUphtK8HOgbfvjcAgL
	KaIylf6YsuoRc/WcDcsNp9dFVTXvmn0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-i1okI0DDNbO3Ba1R8vUdwQ-1; Sat, 03 Sep 2022 13:38:15 -0400
X-MC-Unique: i1okI0DDNbO3Ba1R8vUdwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FA66185A794;
	Sat,  3 Sep 2022 17:38:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03B4C1121314;
	Sat,  3 Sep 2022 17:38:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E1FFB1940342;
	Sat,  3 Sep 2022 17:38:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1EE271946A42 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  3 Sep 2022 17:38:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 11B6B1415138; Sat,  3 Sep 2022 17:38:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E2B11415137
 for <cluster-devel@redhat.com>; Sat,  3 Sep 2022 17:38:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9C51185A794
 for <cluster-devel@redhat.com>; Sat,  3 Sep 2022 17:38:13 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-e5f6fF8nOp-14Y5fi4scPQ-1; Sat, 03 Sep 2022 13:38:12 -0400
X-MC-Unique: e5f6fF8nOp-14Y5fi4scPQ-1
Received: by mail-lf1-f50.google.com with SMTP id w8so7515984lft.12
 for <cluster-devel@redhat.com>; Sat, 03 Sep 2022 10:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Z1VGvcyPcxaVL7OhRrzeu9KO4THMsdUZs/+YFm2RijY=;
 b=3URFwSEO6ZsSQxLYhGIIMvBvy+kuSqIpUz5TegIsSKDFZemAjoCOGFH+gJAcDPvMdL
 A1GUNPo/4K9uNWH5pGllserLdywhQ+xYeYtO8UIUM7ke1FRLXoWHSbUuv6qqKHvyHVG7
 7uv/VTGzDcLlnUTxod8Gix71PJiC2UqvyXTiHcU2tiy8fO+uduMVaidfGP0hKeyekop/
 SiOr61k80CKEVLJkhXgwgw0eIUFL9Kl3JuhMXu14KRbsmplmvOxlEfpSmVSSIv0ODAYN
 fVuFXyC0jyC1AJZjkC7Fr7ExA2MuctleKYpVi5uK9zxi9yVb5Wu9P07QfYVnVm46UYXE
 1q+g==
X-Gm-Message-State: ACgBeo0T2XV6JY8QW7DoRZ0eS2z0/yHFOgPS+XnpAYRuMFTpzVAmFc0a
 WNOOYblg0J3lmp63LKuTyMvzEX+AXvOgMMl2cuI=
X-Google-Smtp-Source: AA6agR4lrNoGuI5rw96XeRPams7GLmC/xZVLf7HmyQGlHcfkfepnxT7a1h01PJ6LedVQXetRHT81hCJoOKKkAxZqFXI=
X-Received: by 2002:a05:6512:1395:b0:48d:81b:4955 with SMTP id
 p21-20020a056512139500b0048d081b4955mr13309674lfa.307.1662226690740; Sat, 03
 Sep 2022 10:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-22-vishal.moola@gmail.com>
In-Reply-To: <20220901220138.182896-22-vishal.moola@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sun, 4 Sep 2022 02:37:53 +0900
Message-ID: <CAKFNMok9qtqHkHzCGW2jckej3ZO47dvU2x+EQ1mJNwVHFHuzvw@mail.gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 21/23] nilfs2: Convert
 nilfs_copy_dirty_pages() to use filemap_get_folios_tag()
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 7:18 AM Vishal Moola (Oracle) wrote:
>
> Convert function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/nilfs2/page.c | 39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi

