Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD504B05B4
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Feb 2022 06:48:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-JS96Q61ZMu-pZHzhcMSQOQ-1; Thu, 10 Feb 2022 00:48:11 -0500
X-MC-Unique: JS96Q61ZMu-pZHzhcMSQOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8810C814245;
	Thu, 10 Feb 2022 05:48:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C75D5108BE;
	Thu, 10 Feb 2022 05:48:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F37054BB7C;
	Thu, 10 Feb 2022 05:48:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21A5m3s0021561 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 10 Feb 2022 00:48:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 123DB401E58; Thu, 10 Feb 2022 05:48:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E75B401470
	for <cluster-devel@redhat.com>; Thu, 10 Feb 2022 05:48:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE01985A5A8
	for <cluster-devel@redhat.com>; Thu, 10 Feb 2022 05:48:02 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-444-xocm2AqNP6WXf84W0T0mVQ-1; Thu, 10 Feb 2022 00:47:58 -0500
X-MC-Unique: xocm2AqNP6WXf84W0T0mVQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7187268B05; Thu, 10 Feb 2022 06:47:54 +0100 (CET)
Date: Thu, 10 Feb 2022 06:47:54 +0100
From: Christoph Hellwig <hch@lst.de>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20220210054754.GB3293@lst.de>
References: <20220209085243.3136536-1-lee.jones@linaro.org>
	<20220209150904.GA22025@lst.de> <YgPk9HhIeFM43b/a@google.com>
MIME-Version: 1.0
In-Reply-To: <YgPk9HhIeFM43b/a@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org, Stable <stable@vger.kernel.org>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Goldwyn Rodrigues <rgoldwyn@suse.com>,
	syzbot+0ed9f769264276638893@syzkaller.appspotmail.com
Subject: Re: [Cluster-devel] [PATCH 1/1] Revert "iomap: fall back to
 buffered writes for invalidation failures"
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 09, 2022 at 03:59:48PM +0000, Lee Jones wrote:
> > Well, maybe you should actually debug and try to understand what is
> > going on before blindly reverting random commits.
> 
> That is not a reasonable suggestion.

In that case we fudamentally disagree what "reasonable" means.

Sending a revert for a 2 year old commit based on a BUG in consumer of
that subsystem based on a really old kernel without any explanation
of why that revert is even directly related to the problem and not just
a casuality is what I would define as completely unreasable.

Please send a proper bug report to the ext4 maintainer first, and we
can work from there.

