Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C69C156C105
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Jul 2022 20:40:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657305612;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5hh5osC6AVGsqRiLiO3asfJH0LnYVH9AB2CSJeAftpM=;
	b=YEEU9uU8noRTQKIZTZZ9CaAv64+HdIm98udTvlZHGN9BELres8hEeo8xmGna7Zmd9KXEXm
	BpBREgl9LtUYS2abqr8OawBuy5RpHjOwtssBSBSClpNq4Rh9yEJDwvOuWJ40N+ptCWA4ZN
	WAdADxHn5RwAPU8YS1N2I9OG4zBaytA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-whe8VAknOtCx-EAGS9Xxcg-1; Fri, 08 Jul 2022 14:40:03 -0400
X-MC-Unique: whe8VAknOtCx-EAGS9Xxcg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1254318188A2;
	Fri,  8 Jul 2022 18:40:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CF9C40357BA;
	Fri,  8 Jul 2022 18:40:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AE37D1947075;
	Fri,  8 Jul 2022 18:40:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4EFFC194706C for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Jul 2022 18:39:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1E326400DFA6; Fri,  8 Jul 2022 18:39:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A9FB40CF8E4
 for <cluster-devel@redhat.com>; Fri,  8 Jul 2022 18:39:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02D6385A588
 for <cluster-devel@redhat.com>; Fri,  8 Jul 2022 18:39:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-jPX0nzW6MPyx--6Lw-7OAg-1; Fri, 08 Jul 2022 14:39:55 -0400
X-MC-Unique: jPX0nzW6MPyx--6Lw-7OAg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E171262569;
 Fri,  8 Jul 2022 18:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EA7C341C0;
 Fri,  8 Jul 2022 18:30:32 +0000 (UTC)
Date: Fri, 8 Jul 2022 14:30:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <20220708143031.29a271d7@gandalf.local.home>
In-Reply-To: <20220620204539.926948-1-aahringo@redhat.com>
References: <20220620204539.926948-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH/RFC] java: add initial bindings
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
Cc: cluster-devel@redhat.com, linux-trace-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Jun 2022 16:45:39 -0400
Alexander Aring <aahringo@redhat.com> wrote:

Hi Alexander!


> This patch adds basic java bindings for libtracecmd. It currently
> supports very basic handling of parsing trace-cmd recorded trace files.
> There might of course additional improvements regarding swig bindings and
> the memory handling. E.g. in javas builtin iterator for-each handling
> everything will keep in memory. The license for the high-level java
> bindings jar file is LGPL-2.1 and is the same as libtracecmd.
> 
> The author of this patch created a java application that uses those java
> bindings to trace locks and represent them in graphical GANTT diagram,
> see [0].
> 
> You need to set the JAVA_HOME environment variable to let the Makefile know
> that it builds the java bindings. This is somehow standard in the java world
> as replacement for pkg-config or similar. There should no trace-cmd java
> dependency, the recommended way should be to provide a kind of trace-cmd-java
> package from your distribution containing the tracecmd.jar and
> libctracecmdjava.so. This package would have then a java dependency to
> e.g. OpenJDK, that I was using to test those bindings for.
> 
> The author is not a swig expert but it works as it currently is. Also
> the author did not hit issues because memory _yet_. Those are beginning
> experimental bindings and can be changed/improved in future.


Are you "the author"?

Could you rephrase this better? 

Like:

"There may be better ways to do this with swig, but this appears to work as
is, as there were no issues because of memory _yet_."

That is, please try to rewrite the change log without referring to yourself.

> 
> [0] https://gitlab.com/netcoder/dlm2slog2
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  .gitignore                        |   4 +
>  Makefile                          |  60 ++++++-
>  java/Makefile                     |  39 +++++
>  java/TraceCmd.java                | 236 +++++++++++++++++++++++++
>  java/TraceCmdEvent.java           | 277 ++++++++++++++++++++++++++++++
>  java/TraceCmdException.java       |  16 ++
>  java/TraceCmdField.java           | 104 +++++++++++
>  java/ctracecmdjava.i              | 180 +++++++++++++++++++
>  java/example/Makefile             |   7 +
>  java/example/TraceCmdExample.java |  33 ++++
>  10 files changed, 953 insertions(+), 3 deletions(-)
>  create mode 100644 java/Makefile
>  create mode 100644 java/TraceCmd.java
>  create mode 100644 java/TraceCmdEvent.java
>  create mode 100644 java/TraceCmdException.java
>  create mode 100644 java/TraceCmdField.java
>  create mode 100644 java/ctracecmdjava.i
>  create mode 100644 java/example/Makefile
>  create mode 100644 java/example/TraceCmdExample.java
> 

I'm not a swig nor Java expert, and will likely not even test this code.
But I'm happy to include it if it doesn't break anything that I do test.
But if anyone complains of breakage, I'll simply point them to you ;-)

Are you OK with that?

Hmm, I should add a MAINTAINERS file to add people that support different
portions of trace-cmd.

-- Steve

