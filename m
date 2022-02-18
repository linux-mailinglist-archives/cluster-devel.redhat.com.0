Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC41B4BB1CB
	for <lists+cluster-devel@lfdr.de>; Fri, 18 Feb 2022 07:08:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-8CHVnuqyOIePj46smSelGQ-1; Fri, 18 Feb 2022 01:08:09 -0500
X-MC-Unique: 8CHVnuqyOIePj46smSelGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E76A814249;
	Fri, 18 Feb 2022 06:08:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3F7D55F4C;
	Fri, 18 Feb 2022 06:08:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA7F54BB7C;
	Fri, 18 Feb 2022 06:08:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21I63Yos005086 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 18 Feb 2022 01:03:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D36D140FF412; Fri, 18 Feb 2022 06:03:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF5D540FF40D
	for <cluster-devel@redhat.com>; Fri, 18 Feb 2022 06:03:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7034811E76
	for <cluster-devel@redhat.com>; Fri, 18 Feb 2022 06:03:34 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-45-ZIVBhldrPeC-y75qZOdS1Q-1; Fri, 18 Feb 2022 01:03:31 -0500
X-MC-Unique: ZIVBhldrPeC-y75qZOdS1Q-1
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
	[108.7.220.252]) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21I63DM2027234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 18 Feb 2022 01:03:14 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 495C915C34C8; Fri, 18 Feb 2022 01:03:13 -0500 (EST)
Date: Fri, 18 Feb 2022 01:03:13 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Yg82oSHmodFHMHHI@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com> <Yg8KZvDVFJgTXm4C@mit.edu>
	<Yg8fdCuE6RusrjIh@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <Yg8fdCuE6RusrjIh@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 18, 2022 at 04:24:20AM +0000, Matthew Wilcox wrote:
> On Thu, Feb 17, 2022 at 09:54:30PM -0500, Theodore Ts'o wrote:
> > process_vm_writev() uses [un]pin_user_pages_remote() which is the same
> > interface uses for RDMA.  But it's not clear this is ever supposed to
> > work for memory which is mmap'ed region backed by a file.
> > pin_user_pages_remote() appears to assume that it is an anonymous
> > region, since the get_user_pages functions in mm/gup.c don't call
> > read_page() to read data into any pages that might not be mmaped in.
> 
> ... it doesn't end up calling handle_mm_fault() in faultin_page()?

Ah yes, sorry, I missed that.  This is what happens when a syzbot bug
is thrown to a file system developer, who then has to wade theough
mm code for which he is not understand....

	   	    	     	    - Ted
			    

