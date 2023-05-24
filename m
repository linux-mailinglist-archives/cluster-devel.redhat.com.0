Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2660870EF0E
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 09:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684912166;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MB0PkgtOYu2DAciIYbJ/doyhq3ZdSDKw62DeZCSSPtg=;
	b=Nc4vClrPSTWvCcqcPYirDqOJHGUxTuVlpRLcFaGmQSQBf13F+Kwh3QILLmiocXTuHNm5rT
	oo8L3LICHivFTjGXh4DYie2dUvKF/mxHO4MkLQgZXvXA+jNVEB+ukCCIjtWjcv3ES9yt7/
	6vFW2ewTucp8FE4QvKMcLqThErOaLRs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-kx6wCMTHPXKLlXk6602_2g-1; Wed, 24 May 2023 03:09:23 -0400
X-MC-Unique: kx6wCMTHPXKLlXk6602_2g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FF7A185A792;
	Wed, 24 May 2023 07:09:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14495492B0B;
	Wed, 24 May 2023 07:09:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF27919465B3;
	Wed, 24 May 2023 07:09:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B3C5119465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 07:09:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A2839C1ED99; Wed, 24 May 2023 07:09:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A68DC164EE
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 07:09:20 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DDE328EC100
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 07:09:20 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-bPuHxkZfMJGnEffRRdiBUw-1; Wed, 24 May 2023 03:09:18 -0400
X-MC-Unique: bPuHxkZfMJGnEffRRdiBUw-1
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-96f50e26b8bso85925966b.2
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 00:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684912157; x=1687504157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MB0PkgtOYu2DAciIYbJ/doyhq3ZdSDKw62DeZCSSPtg=;
 b=DYxUF8GaBQMW0uzN0/VDQr4Frg2xbjjMFydqigIIXZbny9cW2Fmj0ziQ+BwijInsY3
 90/kWX/jIviTowateLCTytyG+HU5NngjpTLhxSoXtCl+djfjS86E1J6mAhOhtbBUa8YD
 uPgMsiL+f6gmhBhH8wST6trTjqAK5znpp7Rib7pNumE7bTUVRXtUa4gKTQU3mjyeJJNB
 mVEnepL7TXO8K0EUzEKzLf4d1jXd0snevbFCW1emBDM5wasiJy3h+3VP1NYbWbUn0nBO
 3iCZ11c/TiE4um8HeFtOP43ZUfFrac2dYRAQ6krSdwXBFybtz+eiJ7Mn13PxZ0XKPfAH
 izSA==
X-Gm-Message-State: AC+VfDy9vDrSZIANIUWa5snQsReCvXWCW8mSPgRbg4RCCNDR5CZgeln4
 3fHQXONUoQjDyiIZtAc8LR1StuuBetQbLhJbHDbA1A==
X-Google-Smtp-Source: ACHHUZ4OvyrYEQkEUfZSmUZD5S0dixYDveppalH3smz8YjXbgWTLCqDqGb6U6n7MopqEkuxUiQE5XNBE/E81YW5lpSg=
X-Received: by 2002:a17:907:60cc:b0:96a:580e:bf0f with SMTP id
 hv12-20020a17090760cc00b0096a580ebf0fmr18686933ejc.14.1684912157630; Wed, 24
 May 2023 00:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230524063810.1595778-1-hch@lst.de>
 <20230524063810.1595778-12-hch@lst.de>
In-Reply-To: <20230524063810.1595778-12-hch@lst.de>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 24 May 2023 09:09:06 +0200
Message-ID: <CAJfpegtt2eD4Cw11f12cmcvHLe9VHhPLQdJWpwyAmeY-SrVuOA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH 11/11] fuse: drop redundant arguments to
 fuse_perform_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: szeredi.hu
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 May 2023 at 08:38, Christoph Hellwig <hch@lst.de> wrote:
>
> pos is always equal to iocb->ki_pos, and mapping is always equal to
> iocb->ki_filp->f_mapping.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>

