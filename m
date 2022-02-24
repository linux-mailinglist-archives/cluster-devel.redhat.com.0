Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 348854C22DC
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Feb 2022 05:05:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-dwnkLTbBOfOA0A5bNuV9yQ-1; Wed, 23 Feb 2022 23:05:05 -0500
X-MC-Unique: dwnkLTbBOfOA0A5bNuV9yQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A336B1091DA1;
	Thu, 24 Feb 2022 04:05:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D59C794B4;
	Thu, 24 Feb 2022 04:05:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3DA74A701;
	Thu, 24 Feb 2022 04:05:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21O44wFp026241 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 23:04:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 94A5920268FE; Thu, 24 Feb 2022 04:04:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9026D2026990
	for <cluster-devel@redhat.com>; Thu, 24 Feb 2022 04:04:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C7DF85A5A8
	for <cluster-devel@redhat.com>; Thu, 24 Feb 2022 04:04:55 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-251-qlBhpInQMBCliiVB3Plr8w-1; Wed, 23 Feb 2022 23:04:51 -0500
X-MC-Unique: qlBhpInQMBCliiVB3Plr8w-1
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
	[108.7.220.252]) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21O44Yce006899
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 23 Feb 2022 23:04:34 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 0A71A15C0036; Wed, 23 Feb 2022 23:04:34 -0500 (EST)
Date: Wed, 23 Feb 2022 23:04:34 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <YhcD0ugEyDMi4wXO@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com>
	<82d0f4e4-c911-a245-4701-4712453592d9@nvidia.com>
	<Yg8bxiz02WBGf6qO@mit.edu>
	<7bd88058-2a9a-92a6-2280-43c805b516c3@nvidia.com>
	<YhbD1T7qhgnz4myM@mit.edu>
	<d75891d6-4c2e-57bc-f840-9d8d5449628a@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <d75891d6-4c2e-57bc-f840-9d8d5449628a@nvidia.com>
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
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Christoph Hellwig <hch@lst.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [REPORT] kernel BUG at fs/ext4/inode.c:2620 -
	page_buffers()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 23, 2022 at 04:44:07PM -0800, John Hubbard wrote:
> 
> Actually...I can confirm that real customers really are doing *exactly* 
> that! Despite the kernel crashes--because the crashes don't always 
> happen unless you have a large (supercomputer-sized) installation. And 
> even then it is not always root-caused properly.

Interesting.  The syzbot reproducer triggers *reliably* on ext4 using
a 2 CPU qemu kernel running on a laptop, and it doesn't require root,
so it's reasonable that Lee is pushing for a fix --- even if for the
Android O or newer, Seccomp can probably prohibit trap
process_vm_writev(2), but it seems unfortunate if say, someone running
a Docker container could take down the entire host OS.

  	 	   	      	       	      - Ted

