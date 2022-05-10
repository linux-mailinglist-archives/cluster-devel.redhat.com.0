Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A49B520E5E
	for <lists+cluster-devel@lfdr.de>; Tue, 10 May 2022 09:30:08 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-74m5oGgGMVaWJ1e06rNtbg-1; Tue, 10 May 2022 03:30:06 -0400
X-MC-Unique: 74m5oGgGMVaWJ1e06rNtbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C826811E80;
	Tue, 10 May 2022 07:30:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9ED4F2166B2F;
	Tue, 10 May 2022 07:30:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 657711947059;
	Tue, 10 May 2022 07:30:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5A6AD194704C for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 May 2022 07:30:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 27D931460E2D; Tue, 10 May 2022 07:30:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 231791460E29
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 07:30:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB5593C11A03
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 07:30:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-RutGQ9czObuhuOdl9sa7Wg-1; Tue, 10 May 2022 03:29:50 -0400
X-MC-Unique: RutGQ9czObuhuOdl9sa7Wg-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1noK3m-000JAw-Cf; Tue, 10 May 2022 07:13:30 +0000
Date: Tue, 10 May 2022 00:13:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <YnoQmuPgK9c5V8ZC@infradead.org>
References: <20220508100630.2642320-1-keescook@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20220508100630.2642320-1-keescook@chromium.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH] gfs2: Use container_of() for
 gfs2_glock(aspace)
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
Cc: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>,
 Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 Bill Wendling <morbo@google.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +/* gfs2_glock_get(), "glock" must be first. */
> +struct glock_aspace {
> +	struct gfs2_glock	glock;
> +	struct address_space	mapping;
> +};

Why does glock need to be first?  The whole point of using container_of
is that we don't have to make that assumption.

>  static inline struct address_space *gfs2_glock2aspace(struct gfs2_glock *gl)
>  {
>  	if (gl->gl_ops->go_flags & GLOF_ASPACE)
> -		return (struct address_space *)(gl + 1);
> +		return &(container_of(gl, struct glock_aspace, glock)->mapping);

Do we even need the braces here?

>  	struct inode *inode = mapping->host;
>  	if (mapping->a_ops == &gfs2_meta_aops)
> -		return (((struct gfs2_glock *)mapping) - 1)->gl_name.ln_sbd;
> +		return container_of(mapping, struct glock_aspace, mapping)->glock.gl_name.ln_sbd;

A local variable would be really nice for the reader here to decompose
this a bit:

		struct glock_aspace *a =
			container_of(mapping, struct glock_aspace, mapping);

		return a->glock.gl_name.ln_sbd;

