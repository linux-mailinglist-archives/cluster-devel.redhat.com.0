Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C063A670
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Nov 2022 11:54:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669632852;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LnetcMz0OAN4g9V/1MzxRKKmUP//8UUkp/n4KOCyRzM=;
	b=SkqDQ4zNA4JQrDT7rLUvcQF/Fg12sCrv3Rxhotv/uHzCAaS6dCk3QmkivPiq5hdjtniI0q
	BUkRao6vpS8C6JBpxjubTndmQttpcwCjqik1BVg5tTbQKYlT5TUI5uvDaKcHkFm5G4N4Y2
	pe1NYwZznpEmCc1+5RteI2VEGaaVK70=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-fWWNU9AnMg-pH3QsUNhk_Q-1; Mon, 28 Nov 2022 05:54:09 -0500
X-MC-Unique: fWWNU9AnMg-pH3QsUNhk_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FE92101A52A;
	Mon, 28 Nov 2022 10:54:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AAB502027063;
	Mon, 28 Nov 2022 10:54:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 19B921946594;
	Mon, 28 Nov 2022 10:54:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C974A1946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 28 Nov 2022 10:54:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A9B6B1415100; Mon, 28 Nov 2022 10:54:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A216A1410DD9
 for <cluster-devel@redhat.com>; Mon, 28 Nov 2022 10:54:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 840431C05AF9
 for <cluster-devel@redhat.com>; Mon, 28 Nov 2022 10:54:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-Jg5lwL8OMSeL_iBLJtjLlw-1; Mon, 28 Nov 2022 05:54:02 -0500
X-MC-Unique: Jg5lwL8OMSeL_iBLJtjLlw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7851661089;
 Mon, 28 Nov 2022 10:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02102C433D6;
 Mon, 28 Nov 2022 10:53:55 +0000 (UTC)
Message-ID: <6a093484bb977355db40c70ffa51386f3d4ed57b.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Date: Mon, 28 Nov 2022 05:53:54 -0500
In-Reply-To: <Y4Dw65Nzt4bX9esd@ZenIV>
References: <20221120210004.381842-1-jlayton@kernel.org>
 <Y4A6/ozhUncxbimi@ZenIV>
 <1d474f53670771f324745f597ec94b63a006d687.camel@kernel.org>
 <Y4Dw65Nzt4bX9esd@ZenIV>
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH] filelock: move file locking definitions
 to separate header file
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Marc Dionne <marc.dionne@auristor.com>, linux-xfs@vger.kernel.org, hch@lst.de,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, Mark Fasheh <mark@fasheh.com>,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Eric Van Hensbergen <ericvh@gmail.com>,
 Tom Talpey <tom@talpey.com>, linux-fsdevel@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org,
 Paulo Alcantara <pc@cjr.nz>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Chuck Lever <chuck.lever@oracle.com>, Anna Schumaker <anna@kernel.org>,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-11-25 at 16:44 +0000, Al Viro wrote:
> On Fri, Nov 25, 2022 at 08:23:45AM -0500, Jeff Layton wrote:
>=20
> > I left it in fs.h for now. Some of the file_operations prototypes need
> > that typedef, and I figure that anyone who is including filelock.h will
> > almost certainly need to include fs.h anyway. We could move it into a
> > separate header too, but it's probably not worth it.
> >=20
> > HCH mentioned years ago though that we should just get rid of fl_owner_=
t
> > altogether and just use 'void *'. I didn't do it at the time because I
> > was focused on other changes, but this might be a good time to change
> > it.
>=20
> Might be...
>=20
> > > > +extern void show_fd_locks(struct seq_file *f,
> > > > +=09=09=09 struct file *filp, struct files_struct *files);
> > >=20
> > > If anything, that would be better off as fl_owner_t...  Again, a sepa=
rate
> > > patch.
> >=20
> > I'm not sure what you mean here. This prototype hasn't changed, and is
> > only called from procfs.
>=20
> Take a look at that function and its caller.  The use of 'files' argument=
 there
> is (and can be) only as an opaque pointer to be compared to ->fl_owner; a=
t that
> point it might be pointing to freed memory, for all we know (and give fal=
se
> positives if already reused).

Ok. What we want this function to do is show any traditional POSIX or
OFD locks that were set on a particular file. The logic in
__show_fd_locks looks right, but you're correct that we don't want
anyone dereferencing those pointers in that codepath.

Note too that this info is not wholly reliable. POSIX locks can merge
with other locks that were set within the same process (same
files_struct) but on different fds.

I think we want to get rid of fl_owner_t anyway. Maybe we should replace
it with an unsigned long instead of void * to discourage anyone from
trying to dereference those pointers?

> TBH, I'd never been able to finish the audit of files_struct pointers pas=
sed
> into locks subsystem; there definitely are moments when code from fs/lock=
s.c
> is dealing with pointers to already freed instances - show_fd_locks() at =
the
> very least.  They are not dereferenced, but beyond that...

Yeah. In general, we try to ensure that locks are torn down before the
file with which it is associated, but with some of the delayed freeing,
they can outlive the file at times. For example:

    https://tracker.ceph.com/issues/57986

--=20
Jeff Layton <jlayton@kernel.org>

