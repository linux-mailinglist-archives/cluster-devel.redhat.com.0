Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8963F2F72
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 17:27:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-ubsaWQOsPqGBCusz-7eSfA-1; Fri, 20 Aug 2021 11:27:44 -0400
X-MC-Unique: ubsaWQOsPqGBCusz-7eSfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A66FB1026201;
	Fri, 20 Aug 2021 15:27:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72C9D26E4E;
	Fri, 20 Aug 2021 15:27:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31716181A0F8;
	Fri, 20 Aug 2021 15:27:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KFRY4E028442 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 11:27:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4A38620C1640; Fri, 20 Aug 2021 15:27:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4306920C1667
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 15:27:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5D9681D9FE
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 15:27:28 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-59-FxxUbQJdO-q196xYKXd-_w-1; Fri, 20 Aug 2021 11:27:26 -0400
X-MC-Unique: FxxUbQJdO-q196xYKXd-_w-1
Received: by mail-pj1-f43.google.com with SMTP id mq3so7509753pjb.5
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 08:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s+pZady9bZxuI5ZV217HLh19NePVUH4NtT4PhDASe8A=;
	b=gECkT0pweWK6hWYiG7WPnzanx78trTxzt8MTq91LvlzWHDjljJ/bGvgU3OYgnSVRUM
	pcpuCPgvWA4PqpSoOn4u8ObrQyvQTRoiA/BnltpOeffumaaqviGiI77tHefNHPV2Zqqn
	VpuPoFjQjxcJmmIGoWcyGwvJQDedoa83yovezx1J+uMYBJspvepxVwgHdbQIINzOQZ/Y
	atUKUSPkJP36P4Wx2RNsdS3DxIHzWEMIabeqqXAokfCRKnh7TiEO+GKG5Gggwmgg4sfX
	1P8gbCLa9bK53K7vkt8l4iNMPZlz5RJUJJC8+yX8B/PeTbWa3kVyYYAyHDuyw8Xgd8b5
	/WMQ==
X-Gm-Message-State: AOAM533o/N+Zu63Ro16s2p6oXAyfrmMO+dk1mGhh6ZSovG0oBamfJ4AG
	ew3zRCQk1xj4A3b5dy9VJtVhR9BBlkhsUTv0/QSlqQ==
X-Google-Smtp-Source: ABdhPJxF0RCYcUVUBwMvZeOpqalPa/B9+Q+bapkBeipJxdjltc3i6RXJVl+F7zMaJbsIi20VC25awiuka6Iizvicc98=
X-Received: by 2002:a17:90b:23d6:: with SMTP id
	md22mr4951556pjb.149.1629473245264; 
	Fri, 20 Aug 2021 08:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-12-hch@lst.de>
	<CAPcyv4hbSYnOC6Pdi1QShRxGjBAteig7nN1h-5cEvsFDX9SuAQ@mail.gmail.com>
	<20210820041158.GA26417@lst.de>
In-Reply-To: <20210820041158.GA26417@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 20 Aug 2021 08:27:14 -0700
Message-ID: <CAPcyv4iQgyPgQhjCwWv9JkA+kx18nRjOucVm+z79uw1zcAbhPg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, cluster-devel@redhat.com,
	"Darrick J. Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 11/30] iomap: add the new iomap_iter
	model
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 19, 2021 at 9:12 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Aug 19, 2021 at 02:25:52PM -0700, Dan Williams wrote:
> > Given most of the iomap_iter users don't care about srcmap, i.e. are
> > not COW cases, they are leaving srcmap zero initialized. Should the
> > IOMAP types be incremented by one so that there is no IOMAP_HOLE
> > confusion? In other words, fold something like this?
>
> A hole really means nothing to read from the source.  The existing code
> also relies on that.

Ok, I've since found iomap_iter_srcmap(). Sorry for the noise.

