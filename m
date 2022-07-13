Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CBC5737AB
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Jul 2022 15:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657719649;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=AKJFqVAEYMrSYdd5FQG6UXoFSGFARh5VVh8jAz8BGD4=;
	b=ehSimsnTEp2/pruRZtLdR+JVwuEhU9noeDh0X4D12duPoPWPJQfGDQnLN0lz4citasOxyT
	crCe1+21/525r8gNEs7JEyTLWL2bleeu9lq/vyy63hmRj1TN2sAGos8SsWvSKNs6M7taWy
	Dz8CByjrNjQDnIeYwASmKvROhaOeyOo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-8igWTsu5MJiSvYg9_5dnzA-1; Wed, 13 Jul 2022 09:40:46 -0400
X-MC-Unique: 8igWTsu5MJiSvYg9_5dnzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DCE18032F6;
	Wed, 13 Jul 2022 13:40:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B2D4C28118;
	Wed, 13 Jul 2022 13:40:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E30CB1947066;
	Wed, 13 Jul 2022 13:40:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 65C9D194705F for <cluster-devel@listman.corp.redhat.com>;
 Wed, 13 Jul 2022 13:40:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 47D562026D07; Wed, 13 Jul 2022 13:40:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 435D22026D64
 for <cluster-devel@redhat.com>; Wed, 13 Jul 2022 13:40:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26CE5101A586
 for <cluster-devel@redhat.com>; Wed, 13 Jul 2022 13:40:41 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-5YRa2vBNOHqfMa9htGZDIA-1; Wed, 13 Jul 2022 09:40:40 -0400
X-MC-Unique: 5YRa2vBNOHqfMa9htGZDIA-1
Received: by mail-qv1-f71.google.com with SMTP id
 q3-20020ad45743000000b004735457f428so3818903qvx.23
 for <cluster-devel@redhat.com>; Wed, 13 Jul 2022 06:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AKJFqVAEYMrSYdd5FQG6UXoFSGFARh5VVh8jAz8BGD4=;
 b=tf37Cdu8jFxWWo8OPvWBJDoUHZ7iwhuBeh/Ip15hai4zoB3HPPPLcAAiSkCjnLRFnx
 /jU6RN+6FqnFl+cMyvnGBpMLjXkRCDWPefaamwvLi8uHesrLAxRuV1Ot8Wtgvy4Tpct8
 H3N5nu+lBfsNLALqZnJXc8K7APbIOfXg4txxAoWwuEELlNDfpltsJGsI69YSLzyoPOKt
 pfVd58H6JJaW8pQAAKONxa4d+wG3m084AYeeKXdARb94jKAvbTTMO9q0B83QrCeXL1xD
 ZYe302WXJS22+N9w+3VTZMEiSthTbsNVr8FH+uNaZ/imSP39cts5+pPlebWifKdleY2G
 8vmg==
X-Gm-Message-State: AJIora9mBEKChWw5TERIdcRxoQYGaFHsdDlygCDTqWc+KxWWY8MakM78
 OPdsG/x6xlZPe9F+hqShRs4RdYBl5O2qRd5LbxbsUT+3Jalu8jUEmml1mxcKSnY6f/i6u6FIQcJ
 weFT9zcePac70HJenC6LlCPJj0qrwXyfm4feh1w==
X-Received: by 2002:a05:620a:468d:b0:6b5:9e91:4b40 with SMTP id
 bq13-20020a05620a468d00b006b59e914b40mr2331739qkb.80.1657719639450; 
 Wed, 13 Jul 2022 06:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uCnsh2Bv7xdTn4Gno39lxl0GxulXCeCnYySAGcf7LLtM5dFyAScpi8FOd/bQHhcZpD/DDq0AfPHWXnNfxLrSU=
X-Received: by 2002:a05:620a:468d:b0:6b5:9e91:4b40 with SMTP id
 bq13-20020a05620a468d00b006b59e914b40mr2331717qkb.80.1657719639134; Wed, 13
 Jul 2022 06:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220620204539.926948-1-aahringo@redhat.com>
 <20220708143031.29a271d7@gandalf.local.home>
In-Reply-To: <20220708143031.29a271d7@gandalf.local.home>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 13 Jul 2022 09:40:28 -0400
Message-ID: <CAK-6q+guYP=X-QKayUeHc_a2r363K9=ES9sakKu9WYB908-0Bg@mail.gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Cc: cluster-devel <cluster-devel@redhat.com>, linux-trace-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Jul 8, 2022 at 2:31 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Mon, 20 Jun 2022 16:45:39 -0400
> Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi Alexander!
>
>
> > This patch adds basic java bindings for libtracecmd. It currently
> > supports very basic handling of parsing trace-cmd recorded trace files.
> > There might of course additional improvements regarding swig bindings and
> > the memory handling. E.g. in javas builtin iterator for-each handling
> > everything will keep in memory. The license for the high-level java
> > bindings jar file is LGPL-2.1 and is the same as libtracecmd.
> >
> > The author of this patch created a java application that uses those java
> > bindings to trace locks and represent them in graphical GANTT diagram,
> > see [0].
> >
> > You need to set the JAVA_HOME environment variable to let the Makefile know
> > that it builds the java bindings. This is somehow standard in the java world
> > as replacement for pkg-config or similar. There should no trace-cmd java
> > dependency, the recommended way should be to provide a kind of trace-cmd-java
> > package from your distribution containing the tracecmd.jar and
> > libctracecmdjava.so. This package would have then a java dependency to
> > e.g. OpenJDK, that I was using to test those bindings for.
> >
> > The author is not a swig expert but it works as it currently is. Also
> > the author did not hit issues because memory _yet_. Those are beginning
> > experimental bindings and can be changed/improved in future.
>
>
> Are you "the author"?
>

yes.

> Could you rephrase this better?
>
> Like:
>
> "There may be better ways to do this with swig, but this appears to work as
> is, as there were no issues because of memory _yet_."
>
> That is, please try to rewrite the change log without referring to yourself.
>

okay.

> >
> > [0] https://gitlab.com/netcoder/dlm2slog2
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> >  .gitignore                        |   4 +
> >  Makefile                          |  60 ++++++-
> >  java/Makefile                     |  39 +++++
> >  java/TraceCmd.java                | 236 +++++++++++++++++++++++++
> >  java/TraceCmdEvent.java           | 277 ++++++++++++++++++++++++++++++
> >  java/TraceCmdException.java       |  16 ++
> >  java/TraceCmdField.java           | 104 +++++++++++
> >  java/ctracecmdjava.i              | 180 +++++++++++++++++++
> >  java/example/Makefile             |   7 +
> >  java/example/TraceCmdExample.java |  33 ++++
> >  10 files changed, 953 insertions(+), 3 deletions(-)
> >  create mode 100644 java/Makefile
> >  create mode 100644 java/TraceCmd.java
> >  create mode 100644 java/TraceCmdEvent.java
> >  create mode 100644 java/TraceCmdException.java
> >  create mode 100644 java/TraceCmdField.java
> >  create mode 100644 java/ctracecmdjava.i
> >  create mode 100644 java/example/Makefile
> >  create mode 100644 java/example/TraceCmdExample.java
> >
>
> I'm not a swig nor Java expert, and will likely not even test this code.
> But I'm happy to include it if it doesn't break anything that I do test.
> But if anyone complains of breakage, I'll simply point them to you ;-)
>
> Are you OK with that?
>
> Hmm, I should add a MAINTAINERS file to add people that support different
> portions of trace-cmd.
>

I already created a new project trace-cmd-java [0]. This will static
link against libtracecmd and their dependencies. At the end it
produces a binary blob for the java bindings. The advantage here is
that I have full control over the used version of libtracecmd and
their dependencies.

I would like to go this way and see how it goes. Meanwhile I can do
more testing and cleanups. I may come back again to bring it upstream.

- Alex

[0] https://gitlab.com/netcoder/trace-cmd-java

