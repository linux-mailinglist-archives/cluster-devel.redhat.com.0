Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 339FD5AC015
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Sep 2022 19:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662226692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=T9PB00G8n49mkQ5GqTry0cp+XpHMmRJWkRcveZs969s=;
	b=D+c4H5LteoOk1uQaLsUGjj4qvxQVy6Mib9cjyTWwAFpu19+edJHmODtJCtEaTe46dnwiYa
	NzLzE6kDMP7xkdXvWZArpL+nZG6s5vwhmXUZo2UtHiX9vS3gGFy9Z1k2zBp/s7aTumPoCS
	f6Hmao83ASgJLbpFSOVmNXE52XYiyLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-6fV-66X1MeGFtWBZfhhzLQ-1; Sat, 03 Sep 2022 13:38:10 -0400
X-MC-Unique: 6fV-66X1MeGFtWBZfhhzLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7BD6811E90;
	Sat,  3 Sep 2022 17:38:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F3F6B2166B26;
	Sat,  3 Sep 2022 17:38:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4B17D1940342;
	Sat,  3 Sep 2022 17:38:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BC7441946A42 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  3 Sep 2022 17:38:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 711642026D07; Sat,  3 Sep 2022 17:38:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CB782026D64
 for <cluster-devel@redhat.com>; Sat,  3 Sep 2022 17:38:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 521A385A585
 for <cluster-devel@redhat.com>; Sat,  3 Sep 2022 17:38:04 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-416-9ZGme3OJNEOTKpyotSNy3A-1; Sat, 03 Sep 2022 13:38:02 -0400
X-MC-Unique: 9ZGme3OJNEOTKpyotSNy3A-1
Received: by mail-lj1-f171.google.com with SMTP id k22so5253630ljg.2
 for <cluster-devel@redhat.com>; Sat, 03 Sep 2022 10:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=T9PB00G8n49mkQ5GqTry0cp+XpHMmRJWkRcveZs969s=;
 b=A0yjmKzgsFivjQP9u6Dl9GWoUb3O7ortfXOSoGyQWjhg329+YdzEHLFVneXdzvPRnJ
 KZ5njGlGuNg2eeRlOYpCSlVGdMHFMnNv/WU5KcGO4sntq3NUo3ZvccEXLbQ3nJZyNmSx
 L+fXZDJj9U8R99FwVwnEW9ze1Z1McXK49fwPvbeXWkXFGfz67JGVrIL2k21YrnnxroOv
 8FgVwKZiQRDdEVM9YpeMYKtCfjILWxyRfTiHOYBclESTkIzXkjYiV+cQHHjhhazt+XKz
 cWRBWqPmHWY+GrX71y/FRUEPSN328VjekO/2ZGNUuN/+hwcr5no/7UGl2N9crFIj5Ozg
 xOgg==
X-Gm-Message-State: ACgBeo1IcAPHjSjGU/0MWvFmd/F4rLIi/zlkzjFpKRhYjpWi1YSEyIr3
 0G5Ptpd2M46pcABCC1rhHpZQyWEPIRbfW4M+iN8=
X-Google-Smtp-Source: AA6agR70Jzdv99OIWtBI+Fq39YHvU0oO+xeoqhKJN9rejAsxAabkcRwmiauhY/c5RKQZKtQjTgpBf1Dezn5qMhA8Xac=
X-Received: by 2002:a2e:8541:0:b0:261:b44b:1a8b with SMTP id
 u1-20020a2e8541000000b00261b44b1a8bmr13288406ljj.46.1662226680495; Sat, 03
 Sep 2022 10:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-20-vishal.moola@gmail.com>
In-Reply-To: <20220901220138.182896-20-vishal.moola@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sun, 4 Sep 2022 02:37:43 +0900
Message-ID: <CAKFNMon3fuhwv32mtP_yV1agLUQkOePOfAN0yBH2X669YgonCA@mail.gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 19/23] nilfs2: Convert
 nilfs_lookup_dirty_node_buffers() to use filemap_get_folios_tag()
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 7:07 AM Vishal Moola (Oracle) wrote:
>
> Convert function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/nilfs2/segment.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi

