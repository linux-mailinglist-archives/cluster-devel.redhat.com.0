Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C12B82271E9
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jul 2020 23:51:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-7KWRGkfqOMSXxxRgKi7nFw-1; Mon, 20 Jul 2020 17:51:50 -0400
X-MC-Unique: 7KWRGkfqOMSXxxRgKi7nFw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCFB310059A9;
	Mon, 20 Jul 2020 21:51:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23BC15D9D5;
	Mon, 20 Jul 2020 21:51:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E7921809557;
	Mon, 20 Jul 2020 21:51:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KLpaTg022753 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 17:51:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E3AD114B2FA; Mon, 20 Jul 2020 21:51:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A228114B2F8
	for <cluster-devel@redhat.com>; Mon, 20 Jul 2020 21:51:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A03C885A5B3
	for <cluster-devel@redhat.com>; Mon, 20 Jul 2020 21:51:33 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-321-qlcEU-3LMhOU-pUSmQ9Tdg-1;
	Mon, 20 Jul 2020 17:51:31 -0400
X-MC-Unique: qlcEU-3LMhOU-pUSmQ9Tdg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C8900ABF4;
	Mon, 20 Jul 2020 21:51:35 +0000 (UTC)
Date: Mon, 20 Jul 2020 16:51:25 -0500
From: Goldwyn Rodrigues <rgoldwyn@suse.de>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200720215125.bfz7geaftocy4r5l@fiona>
References: <20200713074633.875946-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200713074633.875946-1-hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] RFC: iomap write invalidation
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

On  9:46 13/07, Christoph Hellwig wrote:
> Hi all,
> 
> this series has two parts:  the first one picks up Dave's patch to avoid
> invalidation entierly for reads, picked up deep down from the btrfs iomap
> thread.  The second one falls back to buffered writes if invalidation fails
> instead of leaving a stale cache around.  Let me know what you think about
> this approch.

Which kernel version are these changes expected?
btrfs dio switch to iomap depends on this.

-- 
Goldwyn

