Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 49C1C2FB6C6
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 15:14:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611065677;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VSkn6lpyejr9gJy9YxZseQ6+n213U3hayCoLuHBWXlw=;
	b=FmfmQ58AOzGhx4QxO/rl8DV0QoKJ2Dp78wmq8OjgFBQnIlB9BZK1eGqziojpnq5/zVYfPC
	Q0dp382LffFrvC1Fzrm2ey/dAKIRtS2CBDZgmGECgUPagFtsPKdfiSN5JOrPfr5imL4LS8
	0RFMCvfqLbJAd6bv+jsk1VJeJtrusGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-v_EdIqePO-uSP0X9SmTL6Q-1; Tue, 19 Jan 2021 09:14:35 -0500
X-MC-Unique: v_EdIqePO-uSP0X9SmTL6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E90D59;
	Tue, 19 Jan 2021 14:14:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D230C5D9F8;
	Tue, 19 Jan 2021 14:14:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BB244BB7B;
	Tue, 19 Jan 2021 14:14:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JEETpc019124 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 09:14:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B6EF71D7; Tue, 19 Jan 2021 14:14:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA0D19C47;
	Tue, 19 Jan 2021 14:14:23 +0000 (UTC)
Date: Tue, 19 Jan 2021 09:14:22 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20210119141422.GA23758@redhat.com>
References: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	gustavo@embeddedor.com, linux-nvme@lists.infradead.org,
	philipp.reisner@linbit.com, song@kernel.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, adilger.kernel@dilger.ca,
	hch@lst.de, naohiro.aota@wdc.com, sagi@grimberg.me,
	linux-scsi@vger.kernel.org, darrick.wong@oracle.com,
	osandov@fb.com, cluster-devel@redhat.com,
	linux-ext4@vger.kernel.org, kent.overstreet@gmail.com,
	josef@toxicpanda.com, efremov@linux.com, colyli@suse.de,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	dsterba@suse.com, viro@zeniv.linux.org.uk,
	drbd-dev@tron.linbit.com, bvanassche@acm.org, axboe@kernel.dk,
	linux-block@vger.kernel.org, damien.lemoal@wdc.com,
	tytso@mit.edu, martin.petersen@oracle.com, clm@fb.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	jefflexu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	tj@kernel.org, lars.ellenberg@linbit.com, jth@kernel.org,
	asml.silence@gmail.com, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [RFC PATCH 00/37] block: introduce
	bio_init_fields()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jan 19 2021 at 12:05am -0500,
Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com> wrote:

> Hi,
> 
> This is a *compile only RFC* which adds a generic helper to initialize
> the various fields of the bio that is repeated all the places in
> file-systems, block layer, and drivers.
> 
> The new helper allows callers to initialize various members such as
> bdev, sector, private, end io callback, io priority, and write hints.
> 
> The objective of this RFC is to only start a discussion, this it not 
> completely tested at all. Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â 
> Following diff shows code level benefits of this helper :-
> Â 38 files changed, 124 insertions(+), 236 deletions(-)


Please no... this is just obfuscation.

Adding yet another field to set would create a cascade of churn
throughout kernel (and invariably many callers won't need the new field
initialized, so you keep passing 0 for more and more fields).

Nacked-by: Mike Snitzer <snitzer@redhat.com>

