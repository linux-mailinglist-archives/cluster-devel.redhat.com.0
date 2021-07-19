Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E70D73CEA41
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 19:58:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-OwoVUc0vN52cWqjaHDc5iQ-1; Mon, 19 Jul 2021 13:58:10 -0400
X-MC-Unique: OwoVUc0vN52cWqjaHDc5iQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA7CA80365C;
	Mon, 19 Jul 2021 17:58:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBC6860CA0;
	Mon, 19 Jul 2021 17:58:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0D711809C99;
	Mon, 19 Jul 2021 17:58:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JHw5Bw009985 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 13:58:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DD511007A55; Mon, 19 Jul 2021 17:58:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6853911457F5
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 17:58:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 585691078463
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 17:58:02 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-593-u6GjFMXtMMar_uILOEKKjQ-1;
	Mon, 19 Jul 2021 13:57:58 -0400
X-MC-Unique: u6GjFMXtMMar_uILOEKKjQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7C1761006;
	Mon, 19 Jul 2021 17:57:56 +0000 (UTC)
Date: Mon, 19 Jul 2021 10:57:56 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210719175756.GM22357@magnolia>
References: <20210719103520.495450-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210719103520.495450-1-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] RFC: switch iomap to an iterator model
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2021 at 12:34:53PM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this series replies the existing callback-based iomap_apply to an iter based
> model.  The prime aim here is to simply the DAX reflink support, which
> requires iterating through two inodes, something that is rather painful
> with the apply model.  It also helps to kill an indirect call per segment
> as-is.  Compared to the earlier patchset from Matthew Wilcox that this
> series is based upon it does not eliminate all indirect calls, but as the
> upside it does not change the file systems at all (except for the btrfs
> and gfs2 hooks which have slight prototype changes).

FWIW patches 9-20 look ok to me, modulo the discussion I started in
patch 8 about defining a distinct type for iomap byte lengths instead of
the combination of int/ssize_t/u64 that we use now.

> This passes basic testing on XFS for block based file systems.  The DAX
> changes are entirely untested as I haven't managed to get pmem work in
> recent qemu.

This gets increasingly difficult as time goes by.

Right now I have the following bits of libvirt xml in the vm
definitions:

  <maxMemory slots='32' unit='KiB'>1073741824</maxMemory>
  <devices>
    <memory model='nvdimm' access='shared'>
      <source>
        <path>/run/g.mem</path>
      </source>
      <target>
        <size unit='KiB'>10487808</size>
        <node>0</node>
      </target>
      <address type='dimm' slot='0'/>
    </memory>
  </devices>

Which seems to translate to:

-machine pc-q35-4.2,accel=kvm,usb=off,vmport=off,dump-guest-core=off,nvdimm=on
-object memory-backend-file,id=memnvdimm0,prealloc=no,mem-path=/run/g.mem,share=yes,size=10739515392,align=128M
-device nvdimm,memdev=memnvdimm0,id=nvdimm0,slot=0,label-size=2M

Evidently something was added to the pmem code(?) that makes it fussy if
the memory region doesn't align to a 128M boundary or the label isn't
big enough for ... whatever gets written into them.

The file /run/g.mem is intended to provide 10GB of pmem to the VM, with
an additional 2M allocated for the label.

--D

> Diffstat:
>  b/fs/btrfs/inode.c       |    5 
>  b/fs/buffer.c            |    4 
>  b/fs/dax.c               |  578 ++++++++++++++++++++++-------------------------
>  b/fs/gfs2/bmap.c         |    5 
>  b/fs/internal.h          |    4 
>  b/fs/iomap/Makefile      |    2 
>  b/fs/iomap/buffered-io.c |  344 +++++++++++++--------------
>  b/fs/iomap/direct-io.c   |  162 ++++++-------
>  b/fs/iomap/fiemap.c      |  101 +++-----
>  b/fs/iomap/iter.c        |   74 ++++++
>  b/fs/iomap/seek.c        |   88 +++----
>  b/fs/iomap/swapfile.c    |   38 +--
>  b/fs/iomap/trace.h       |   35 +-
>  b/include/linux/iomap.h  |   73 ++++-
>  fs/iomap/apply.c         |   99 --------
>  15 files changed, 777 insertions(+), 835 deletions(-)

