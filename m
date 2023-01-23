Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C335B6778E4
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Jan 2023 11:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674468950;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1SH4cG+K9PIUmuCGlaDzJqg6vm0VNBfB4+WWhDCmF2c=;
	b=L2MTGE3ocLdbYpJVj5DYO5FrjNlkGIlaoPFmGBJnFUon8nbLhNqDhZY8LFGoxOCyPHnkLb
	UINu/GvhdK90pYRXVOMSqe1QskvIAhd3xwd3RJm3r98suAtCKps3HTvpe05BFaT/BqrYMO
	c5joJIY/h7cq/6k3KRlCzpksIUrX4zk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-hNZGdc4nONifXuW2HMe0cA-1; Mon, 23 Jan 2023 05:15:48 -0500
X-MC-Unique: hNZGdc4nONifXuW2HMe0cA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73C5C3848C28;
	Mon, 23 Jan 2023 10:15:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91B511121333;
	Mon, 23 Jan 2023 10:15:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B56A11946594;
	Mon, 23 Jan 2023 10:15:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 342EE1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 23 Jan 2023 10:15:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 04F671415108; Mon, 23 Jan 2023 10:15:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F061C140EBF4
 for <cluster-devel@redhat.com>; Mon, 23 Jan 2023 10:15:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D48F3882822
 for <cluster-devel@redhat.com>; Mon, 23 Jan 2023 10:15:14 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-84-vjChjEAHN72wdHwFec_jEw-1; Mon,
 23 Jan 2023 05:15:13 -0500
X-MC-Unique: vjChjEAHN72wdHwFec_jEw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C82F81F86B;
 Mon, 23 Jan 2023 10:05:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B75CB134F5;
 Mon, 23 Jan 2023 10:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OtXBLARczmOsDwAAMHmgww
 (envelope-from <jack@suse.cz>); Mon, 23 Jan 2023 10:05:56 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 4CBEBA06B5; Mon, 23 Jan 2023 11:05:56 +0100 (CET)
Date: Mon, 23 Jan 2023 11:05:56 +0100
From: Jan Kara <jack@suse.cz>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20230123100556.qxdjdmcms5ven52v@quack3>
References: <20230122090115.1563753-1-agruenba@redhat.com>
 <CAHk-=wgjMNbNG0FMatHtmzEZPj0ZmQpNRsnRvH47igJoC9TBww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgjMNbNG0FMatHtmzEZPj0ZmQpNRsnRvH47igJoC9TBww@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 writepage fix
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
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>,
 Trond Myklebust <trondmy@hammerspace.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun 22-01-23 12:05:53, Linus Torvalds wrote:
> On Sun, Jan 22, 2023 at 1:01 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > gfs2 writepage fix
> >
> > - Fix a regression introduced by commit "gfs2: stop using
> >   generic_writepages in gfs2_ail1_start_one".
> 
> Hmm. I'm adding a few more people and linux-fsdevel to the reply,
> because we had a number of filesystems remove writepages use lately,
> including some that did it as a fix after the merge window.
> 
> Everybody involved seemed to claim it was just a no-brainer
> switch-over, and I just took that on faith. Now it looks like that
> wasn't true at least for gfs2 due to different semantics.
> 
> Maybe the gfs2 issue is purely because of how gfs2 did the conversion
> (generic_writepages -> filemap_fdatawrite_wbc), but let's make people
> look at their own cases.

Thanks for the heads up. So we had kind of a similar issue for ext4 but it
got caught by Ted during his regression runs so we've basically done what
GFS2 is doing for the merge window and now there's patchset pending to
convert the data=journal path as well because as Andreas states in his
changelog of the revert that's a bit more tricky. But at least for ext4
the conversion of data=journal path resulted in much cleaner and shorter
code.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

