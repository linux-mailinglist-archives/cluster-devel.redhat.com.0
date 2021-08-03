Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 068533DF6AC
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Aug 2021 22:58:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-VS_xEQlTOpSef0NNGlxkTw-1; Tue, 03 Aug 2021 16:58:49 -0400
X-MC-Unique: VS_xEQlTOpSef0NNGlxkTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5103B189CD04;
	Tue,  3 Aug 2021 20:58:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 200E15D6A8;
	Tue,  3 Aug 2021 20:58:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 900E74BB7C;
	Tue,  3 Aug 2021 20:58:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 173KvAHF022055 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Aug 2021 16:57:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6BFE22166B5E; Tue,  3 Aug 2021 20:57:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66E112166B13
	for <cluster-devel@redhat.com>; Tue,  3 Aug 2021 20:57:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E4D58CA942
	for <cluster-devel@redhat.com>; Tue,  3 Aug 2021 20:57:06 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-299-6DcqIwRoP0eGngza1dkekg-1; Tue, 03 Aug 2021 16:57:04 -0400
X-MC-Unique: 6DcqIwRoP0eGngza1dkekg-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mB1TC-006YXJ-2M; Tue, 03 Aug 2021 20:57:02 +0000
Date: Tue, 3 Aug 2021 20:57:02 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YQmtnuqDwBIBf4N+@zeniv-ca.linux.org.uk>
References: <20210803191818.993968-1-agruenba@redhat.com>
	<20210803191818.993968-4-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210803191818.993968-4-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v5 03/12] Turn fault_in_pages_{readable,
 writeable} into fault_in_{readable, writeable}
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 03, 2021 at 09:18:09PM +0200, Andreas Gruenbacher wrote:
> Turn fault_in_pages_{readable,writeable} into versions that return the number
> of bytes faulted in instead of returning a non-zero value when any of the
> requested pages couldn't be faulted in.  This supports the existing users that
> require all pages to be faulted in, but also new users that are happy if any
> pages can be faulted in.
> 
> Neither of these functions is entirely trivial and it doesn't seem useful to
> inline them, so move them to mm/gup.c.
> 
> Rename the functions to fault_in_{readable,writeable} to make sure that code
> that uses them can be fixed instead of breaking silently.

Sigh...  We'd already discussed that; it's bloody pointless.  Making short
fault-in return success - absolutely.  Reporting exact number of bytes is
not going to be of any use to callers.

Please, don't.

