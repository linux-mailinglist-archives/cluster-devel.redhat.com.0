Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F223D78A3BF
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Aug 2023 03:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693184705;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=joEHMg4Vnx51INzte3pGka01/tHMgi/viw3PIuubDEg=;
	b=hSB7vULoRAHqXpGHy8zJ1VBgYvaZCS4A/BRF3GJyPxK2sPAkr2es9ioAmEGx7lXVxEx3/P
	iDmHwFeNb2+rYSh0Coz+HJw3B20EU2PvGsccSOJYnaZlpDD+U85sxNEDrJp3M5448nA9Gd
	aXLxXCujwxl72DynbLx4e7Kcb5cPZQ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-zFr8OGdGMx6kP9vZ28zhzQ-1; Sun, 27 Aug 2023 21:05:00 -0400
X-MC-Unique: zFr8OGdGMx6kP9vZ28zhzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EF1185CBE6;
	Mon, 28 Aug 2023 01:04:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15DA89A;
	Mon, 28 Aug 2023 01:04:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A302219465B7;
	Mon, 28 Aug 2023 01:04:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 934F519465A8 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 28 Aug 2023 01:04:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 726A01121319; Mon, 28 Aug 2023 01:04:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AA6D1121318
 for <cluster-devel@redhat.com>; Mon, 28 Aug 2023 01:04:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E03729AB3E0
 for <cluster-devel@redhat.com>; Mon, 28 Aug 2023 01:04:56 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-XYU6KTSOONukwlsY-U7oHg-1; Sun,
 27 Aug 2023 21:04:53 -0400
X-MC-Unique: XYU6KTSOONukwlsY-U7oHg-1
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qaQgN-001R4E-2B; Mon, 28 Aug 2023 01:04:43 +0000
Date: Mon, 28 Aug 2023 02:04:43 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230828010443.GV3390869@ZenIV>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-4-hch@lst.de>
 <20230827194122.GA325446@ZenIV>
MIME-Version: 1.0
In-Reply-To: <20230827194122.GA325446@ZenIV>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH 03/12] filemap: update ki_pos in
 generic_perform_write
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
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Chao Yu <chao@kernel.org>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: zeniv.linux.org.uk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 27, 2023 at 08:41:22PM +0100, Al Viro wrote:

> That part is somewhat fishy - there's a case where you return a positive value
> and advance ->ki_pos by more than that amount.  I really wonder if all callers
> of ->write_iter() are OK with that.

Speaking of which, in case of negative return value we'd better *not* use
->ki_pos; consider e.g. generic_file_write_iter() with O_DSYNC and
vfs_fsync_range() failure.  An error gets returned, but ->ki_pos is left
advanced.  Normal write(2) is fine - it will only update file->f_pos if
->write_iter() has returned a non-negative.  However, io_uring
kiocb_done() starts with
        if (req->flags & REQ_F_CUR_POS)
                req->file->f_pos = rw->kiocb.ki_pos;
        if (ret >= 0 && (rw->kiocb.ki_complete == io_complete_rw)) {
                if (!__io_complete_rw_common(req, ret)) {
                        /*
                         * Safe to call io_end from here as we're inline
                         * from the submission path.
                         */
                        io_req_io_end(req);
                        io_req_set_res(req, final_ret,
                                       io_put_kbuf(req, issue_flags));
                        return IOU_OK;
                }
        } else {
                io_rw_done(&rw->kiocb, ret);
        }
Note that ->f_pos update is *NOT* conditional upon ret >= 0 - it happens
no matter what, provided that original request had ->kiocb.ki_pos equal
to -1 (on a non-FMODE_STREAM file).

Jens, is there any reason for doing that unconditionally?  IMO it's
a bad idea - there's a wide scope for fuckups that way, especially
since write(2) is not sensitive to that and this use of -1 ki_pos
is not particularly encouraged on io_uring side either, AFAICT.
Worse, it's handling of failure exits in the first place, which
already gets little testing...

