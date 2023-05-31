Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB1F7186D5
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 17:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685548529;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Kr7AYf3i1eBygjzH5q6AjnbmzDMGTDydvzH6ggOcr8w=;
	b=E3xT5TrK3M5nfm4G7Z/XhLk5wVlmjQimbv6/P7m7aGmiMZZY+PWQW8i1u5EjxYOEVvGAI+
	gaOq+GvSs7ge4Voj1hDA4R+s4nCEb/yOpW0KspArbbieMqL18cXEMeAkMglQIOAADods+B
	UPj3f1VLm0olVljV7GkRrseyvv5U1+E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-KnqVAa8HOBurAALehGdonA-1; Wed, 31 May 2023 11:55:26 -0400
X-MC-Unique: KnqVAa8HOBurAALehGdonA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5845858F18;
	Wed, 31 May 2023 15:55:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A90BB202696C;
	Wed, 31 May 2023 15:55:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 29BE619465A8;
	Wed, 31 May 2023 15:55:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1999F19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 15:50:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F211E40D1B60; Wed, 31 May 2023 15:50:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAE7340C6EC4
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 15:50:26 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFF523C397C0
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 15:50:26 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-eNc8UBCyM-ipkKl04x7KeQ-1; Wed, 31 May 2023 11:50:20 -0400
X-MC-Unique: eNc8UBCyM-ipkKl04x7KeQ-1
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3357fc32a31so1289115ab.1
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 08:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685548219; x=1688140219;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kr7AYf3i1eBygjzH5q6AjnbmzDMGTDydvzH6ggOcr8w=;
 b=JiJFS8WDIWY9S2A93AIgUBfIf1R1srA2ljTn/XqfLoPcJtugVAB/u1u60FCnkvAx1u
 A/Ghzfro00/AziJlWdn1z13FiJGifwdjrSH/+7EdY4JolYjzvr6nprw6Rs/GGZiTJEB/
 10Xw+F7I9tltDHYBW7jzG0HD0kIqwcRr1X/49QP5T8IyABLDcZqc0VIcK9Lg8VMag4dE
 Sr2ZbqrTdVAPns2+B1Qm6d68E4C+1aea5mzFGctnTtF6uZbfTW/XhZ3M05UdYBi+swcr
 ym83BdmLoj8oeZdxs+k3D+cqHchKM6wOAu6kGZ+W5GXJYVg4YJsuK1ATqhd0fZWBe2Hc
 CsWw==
X-Gm-Message-State: AC+VfDwyRHXbNqYbtZRYQw/1KOYpFIrxW46SMpSWtqaKUiZwjXduoZia
 Yqn3nsG7T14rIQ9VxUFyW4YbHQ==
X-Google-Smtp-Source: ACHHUZ4Vc5K9goUssaOAlBejpFmpFM1M2MosneBhWp7jmoz34Mcc3cGA6Lj397yP4Jgger0rhBRBog==
X-Received: by 2002:a05:6e02:1061:b0:32b:51df:26a0 with SMTP id
 q1-20020a056e02106100b0032b51df26a0mr1411548ilj.2.1685548219545; 
 Wed, 31 May 2023 08:50:19 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 a4-20020a927f04000000b0033355fa5440sm3211579ild.37.2023.05.31.08.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 08:50:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
In-Reply-To: <cover.1685532726.git.johannes.thumshirn@wdc.com>
References: <cover.1685532726.git.johannes.thumshirn@wdc.com>
Message-Id: <168554821814.183617.716542495633198655.b4-ty@kernel.dk>
Date: Wed, 31 May 2023 09:50:18 -0600
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v7 00/20] bio: check return values of
 bio_add_page
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
Cc: linux-raid@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 cluster-devel@redhat.com, Chaitanya Kulkarni <kch@nvidia.com>,
 Song Liu <song@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, gouha7@uniontech.com,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.dk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit


On Wed, 31 May 2023 04:50:23 -0700, Johannes Thumshirn wrote:
> We have two functions for adding a page to a bio, __bio_add_page() which is
> used to add a single page to a freshly created bio and bio_add_page() which is
> used to add a page to an existing bio.
> 
> While __bio_add_page() is expected to succeed, bio_add_page() can fail.
> 
> This series converts the callers of bio_add_page() which can easily use
> __bio_add_page() to using it and checks the return of bio_add_page() for
> callers that don't work on a freshly created bio.
> 
> [...]

Applied, thanks!

[01/20] swap: use __bio_add_page to add page to bio
        commit: cb58bf91b138c1a8b18cca9503308789e26e3522
[02/20] drbd: use __bio_add_page to add page to bio
        commit: 8f11f79f193c935da617375ba5ea4e768a73a094
[03/20] dm: dm-zoned: use __bio_add_page for adding single metadata page
        commit: fc8ac3e539561aff1c0a255d701d9412d425373c
[04/20] fs: buffer: use __bio_add_page to add single page to bio
        commit: 741af75d4027b1229fc6e62f4e3c4378dfe04897
[05/20] md: use __bio_add_page to add single page
        commit: 3c383235c51dcd6198d37ac3ac06e2acad79f981
[06/20] md: raid5-log: use __bio_add_page to add single page
        commit: b0a2f17cad9d3fa564d67c543f5d19343401fefd
[07/20] md: raid5: use __bio_add_page to add single page to new bio
        commit: 6eea4ff8528d6a5b9f0eeb47992e48a8f44b5b8f
[08/20] jfs: logmgr: use __bio_add_page to add single page to bio
        commit: 2896db174ced7a800863223f9e74543b98271ba0
[09/20] gfs2: use __bio_add_page for adding single page to bio
        commit: effa7ddeeba782406c81b572791a142fbdaf6b05
[10/20] zonefs: use __bio_add_page for adding single page to bio
        commit: 0fa5b08cf6e17b0a64ffcc5894d8efe186691ab8
[11/20] zram: use __bio_add_page for adding single page to bio
        commit: 34848c910b911838e1e83e1370cb988b578c8860
[12/20] floppy: use __bio_add_page for adding single page to bio
        commit: 5225229b8fdfb3e65520c43547ecf9a737161c3f
[13/20] md: check for failure when adding pages in alloc_behind_master_bio
        commit: 6473bc325644b9c8473e6c92bfb520a68dce1e12
[14/20] md: raid1: use __bio_add_page for adding single page to bio
        commit: 2f9848178cfa4ac68a5b46e63e5163a09b8bd80f
[15/20] md: raid1: check if adding pages to resync bio fails
        commit: 33332be32fe91ff54ff326b3a1608973544e835a
[16/20] dm-crypt: use __bio_add_page to add single page to clone bio
        commit: 9be63ecfdd63f957b9ed25eaf85666d22a02d7a5
[17/20] block: mark bio_add_page as __must_check
        commit: 5b3e39c1cc8e1cf31a398830dd665eb15546b4f7
[18/20] block: add bio_add_folio_nofail
        commit: 42205551d1d43b1b42942fb7ef023cf954136cea
[19/20] fs: iomap: use bio_add_folio_nofail where possible
        commit: f31c58ab3ddaf64503d7988197602d7443d5be37
[20/20] block: mark bio_add_folio as __must_check
        commit: 9320744e4dbe10df6059b2b6531946c200a0ba3b

Best regards,
-- 
Jens Axboe



