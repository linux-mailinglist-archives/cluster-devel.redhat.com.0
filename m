Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9D4712247
	for <lists+cluster-devel@lfdr.de>; Fri, 26 May 2023 10:34:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685090067;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=a1+k8geEgB3EI42+JJ+lx1nGKMJgJ9cIZX0cMtf11v8=;
	b=OqbRugrKuUDBu7gjLc4to3/piqo3iRp3G2AjmyENS+dFYY8Hgd42HdKmRt0q07Ml+n2sdN
	VO9X/c+eqiQAOxtBoqWHLEVOI1h3cDUuoX80S5W/H9DWixWdY3lME3/j1/FLAKDMHMT3rg
	ymFPdXRlWOMUGzUMVPGOPLLw5cjjtvw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-UuvyxpEeO1GZwdSIWYPlFQ-1; Fri, 26 May 2023 04:34:22 -0400
X-MC-Unique: UuvyxpEeO1GZwdSIWYPlFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D19551C04181;
	Fri, 26 May 2023 08:34:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F123140E95D;
	Fri, 26 May 2023 08:34:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4786819465B1;
	Fri, 26 May 2023 08:34:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1446819465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 26 May 2023 08:34:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C7CDA1121315; Fri, 26 May 2023 08:34:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C03251121314
 for <cluster-devel@redhat.com>; Fri, 26 May 2023 08:34:19 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98A8585A5B5
 for <cluster-devel@redhat.com>; Fri, 26 May 2023 08:34:19 +0000 (UTC)
Received: from out-25.mta0.migadu.com (out-25.mta0.migadu.com
 [91.218.175.25]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-nHcXhhivNuCFbbbUNwz7kQ-1; Fri, 26 May 2023 04:34:17 -0400
X-MC-Unique: nHcXhhivNuCFbbbUNwz7kQ-1
Date: Fri, 26 May 2023 04:34:11 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <ZHBvA9uy8A0YdK1p@moria.home.lan>
References: <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
 <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzoJLCRLk+pCKAk@infradead.org> <ZGzrV5j7OUU6rYij@moria.home.lan>
 <ZG2yFFcpE7w/Glge@infradead.org> <ZG3GHoNnJJW4xX2H@moria.home.lan>
 <ZG8jJRcwtx3JQf6Q@infradead.org> <ZG/KH9cQluA5e30N@moria.home.lan>
 <ZHBolpHP5JAmt65V@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZHBolpHP5JAmt65V@infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH 06/32] sched: Add
 task_struct->faults_disabled_mapping
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
Cc: dhowells@redhat.com, Jan Kara <jack@suse.cz>,
 "Darrick J . Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-bcachefs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 26, 2023 at 01:06:46AM -0700, Christoph Hellwig wrote:
> On Thu, May 25, 2023 at 04:50:39PM -0400, Kent Overstreet wrote:
> > A cache that isn't actually consistent is a _bug_. You're being
> > Obsequious. And any time this has come up in previous discussions
> > (including at LSF), that was never up for debate, the only question has
> > been whether it was even possible to practically fix it.
> 
> That is not my impression.  But again, if you think it is useful,
> go ahead and seel people on the idea.  But please prepare a series
> that includes the rationale, performance tradeoffs and real live
> implications for it.  And do it on the existing code that people use
> and not just your shiny new thing.

When I'm ready to lift this to the VFS level I will; it should simplify
locking overall and it'll be one less thing for people to worry about.

(i.e. the fact that even _readahead_ can pull in pages a dio is
invalidating is a really nice footgun if not worked around).

Right now though I've got more than enough on my plate just trying to
finally get bcachefs merged, I'm happy to explain what this is for but
I'm not ready for additional headaches or projects yet.

