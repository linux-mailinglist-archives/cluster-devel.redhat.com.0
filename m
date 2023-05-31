Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9C3717BC6
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 11:23:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685525029;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=T/bYqGFJ4VOGoB5+32Mcq8JR70Vd1T1ITCSeV7/3ifk=;
	b=WVnMMuRGKH6MH+fUhxnRxd6ECVWdoHvJkl61DPoe6voIMYLwfEalk2kQDM3nrr+eim22Yx
	LYKKpSnAfS8CobjD5dmZpioJ0f+PS/2HdveD8GdvxqQ1wI61+d4+rAJKe+T+b1fWXiey9A
	zTs4UAdzkidGGVYj1P/+XZWRYbu7Xsc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-P_FUeJqOPn23-Mev6L7z2w-1; Wed, 31 May 2023 05:23:45 -0400
X-MC-Unique: P_FUeJqOPn23-Mev6L7z2w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B041D800B35;
	Wed, 31 May 2023 09:23:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95AB2492B00;
	Wed, 31 May 2023 09:23:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E7D819465A8;
	Wed, 31 May 2023 09:23:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C94351946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 09:15:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B5546492B0E; Wed, 31 May 2023 09:15:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADEBB492B0C
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 09:15:43 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FD54101A531
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 09:15:43 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-OZG2Q34zNVu84RsTvW0pFQ-1; Wed, 31 May 2023 05:15:39 -0400
X-MC-Unique: OZG2Q34zNVu84RsTvW0pFQ-1
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-96fd3a658eeso789512266b.1
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 02:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685524538; x=1688116538;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T/bYqGFJ4VOGoB5+32Mcq8JR70Vd1T1ITCSeV7/3ifk=;
 b=LMstGNGVf5//a+d152UHgd+twG9PumlXCS3aSHKyIJTLdcEX1oi2v3nuf+ERKSfGXp
 BUfYYh68xde+AZWLCIaE6NUkDsrLF2/yKNbpKGtRjb8DGP+K6H8Gcz8wrld+oAbDjts/
 fuVV2vvixnweVLb4meDVITYWqXA215agYawAcs/x+sbzDUBoF6c6LFf3AXFMmJgS82Yl
 tDzR6LF7RH0jAm5Oc/E1rjOFA6mXeiNMf8e8HaUntdQ6ioiNBfpA8n/mLJ6LOw8sq7Gh
 CkyTZMzsNKPW3JmTdg8NEjAf9t7RzGYXWiq1dA8nmlBvBq4y5mvZKo/8V84ruh24/zX5
 AXug==
X-Gm-Message-State: AC+VfDxe71V9c52lAB76hI+6J5sXtri2Q2L/mNyf6Kb5m61osZTkehVl
 hx7EJ74qzohY9u9Y3t/1rWcjLJGZsvtKiLl4dwsWcA==
X-Google-Smtp-Source: ACHHUZ4+FWciM8qyJY0wuGopESAGDBSeuypok3sj/I3YbiV8yhFjyVDeVyjcnaAR9QRVCUk4jCbe3rFAcVDPPt68Cvo=
X-Received: by 2002:a17:906:9756:b0:967:21:5887 with SMTP id
 o22-20020a170906975600b0096700215887mr4163471ejy.40.1685524538465; Wed, 31
 May 2023 02:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230531075026.480237-1-hch@lst.de>
 <20230531075026.480237-10-hch@lst.de>
In-Reply-To: <20230531075026.480237-10-hch@lst.de>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 31 May 2023 11:15:27 +0200
Message-ID: <CAJfpegtPM_=3uGdxxkb9xP8LVg5P0Lm-w4TNLYhw+MqcNi8c1g@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 09/12] fs: factor out a
 direct_write_fallback helper
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: szeredi.hu
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 May 2023 at 09:50, Christoph Hellwig <hch@lst.de> wrote:
>
> Add a helper dealing with handling the syncing of a buffered write fallback
> for direct I/O.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Miklos Szeredi <mszeredi@redhat.com>

