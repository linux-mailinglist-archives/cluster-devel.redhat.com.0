Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF273F302B
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 17:51:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-AfLBygv_NIGUOXTMEyLPkg-1; Fri, 20 Aug 2021 11:51:07 -0400
X-MC-Unique: AfLBygv_NIGUOXTMEyLPkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03B2687D544;
	Fri, 20 Aug 2021 15:51:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2B125D9FC;
	Fri, 20 Aug 2021 15:51:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA8574BB7B;
	Fri, 20 Aug 2021 15:51:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KFp1nA031263 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 11:51:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D0B3C20C164C; Fri, 20 Aug 2021 15:51:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB86320C1653
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 15:50:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 370C8800182
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 15:50:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-322-J7984-fkOria2qdZWtCJnQ-1;
	Fri, 20 Aug 2021 11:50:55 -0400
X-MC-Unique: J7984-fkOria2qdZWtCJnQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22846610FF;
	Fri, 20 Aug 2021 15:50:52 +0000 (UTC)
Message-ID: <7efb04fe6e0c867e7c87d75cf3349221b08b4210.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Laight <David.Laight@ACULAB.COM>, "torvalds@linux-foundation.org"
	<torvalds@linux-foundation.org>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Date: Fri, 20 Aug 2021 11:50:51 -0400
In-Reply-To: <c1318459eaab436aacb225982c49c4b4@AcuMS.aculab.com>
References: <20210820135707.171001-1-jlayton@kernel.org>
	<20210820135707.171001-2-jlayton@kernel.org>
	<c1318459eaab436aacb225982c49c4b4@AcuMS.aculab.com>
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
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
Cc: "bfields@fieldses.org" <bfields@fieldses.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"david@redhat.com" <david@redhat.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>, "w@1wt.eu" <w@1wt.eu>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	"luto@kernel.org" <luto@kernel.org>, "v9fs-developer@lists.sourceforge.net"
	<v9fs-developer@lists.sourceforge.net>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>
Subject: Re: [Cluster-devel] [PATCH v2 1/2] fs: warn about impending
 deprecation of mandatory locks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit

On Fri, 2021-08-20 at 15:49 +0000, David Laight wrote:
> From: Jeff Layton
> > Sent: 20 August 2021 14:57
> > 
> > We've had CONFIG_MANDATORY_FILE_LOCKING since 2015 and a lot of distros
> > have disabled it. Warn the stragglers that still use "-o mand" that
> > we'll be dropping support for that mount option.
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/namespace.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/fs/namespace.c b/fs/namespace.c
> > index ab4174a3c802..ffab0bb1e649 100644
> > --- a/fs/namespace.c
> > +++ b/fs/namespace.c
> > @@ -1716,8 +1716,16 @@ static inline bool may_mount(void)
> >  }
> > 
> >  #ifdef	CONFIG_MANDATORY_FILE_LOCKING
> > +static bool warned_mand;
> >  static inline bool may_mandlock(void)
> >  {
> > +	if (!warned_mand) {
> > +		warned_mand = true;
> > +		pr_warn("======================================================\n");
> > +		pr_warn("WARNING: the mand mount option is being deprecated and\n");
> > +		pr_warn("         will be removed in v5.15!\n");
> > +		pr_warn("======================================================\n");
> > +	}
> >  	return capable(CAP_SYS_ADMIN);
> >  }
> 
> If that is called more than once you don't want the 'inline'.
> I doubt it matters is not inlined - hardly a hot path.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

ACK. Of course. That really needs to not be inline. I'll fix that up in
my tree.

Thanks!
-- 
Jeff Layton <jlayton@kernel.org>

