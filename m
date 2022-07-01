Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F14563324
	for <lists+cluster-devel@lfdr.de>; Fri,  1 Jul 2022 14:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656677245;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zXhzCgqTisWYCfLQ5y3NkLn493B5u6s+MotNFCqarsA=;
	b=P0yWmVSBUBwpG8A9ZZ6h3DTtpMJMIET33y2TdVc7UefTsMk+o/1z7fnwk56+UfxaeFd+ji
	LRTmCL0EhtZYx91kaNGkoqZqPI/0CxJbtbcLlBoX3mjYZbPnR7SOPITvDhTyUUafpglO0x
	dfMYiDBcJAxgxs+FNkFjWT4qmiL0cjA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-IDSuFu_ZM6eRgZMbaCIlXQ-1; Fri, 01 Jul 2022 08:07:20 -0400
X-MC-Unique: IDSuFu_ZM6eRgZMbaCIlXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8398B280DE0C;
	Fri,  1 Jul 2022 12:07:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63C902166B26;
	Fri,  1 Jul 2022 12:07:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5AC6C1947B92;
	Fri,  1 Jul 2022 12:07:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 630381947070 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  1 Jul 2022 12:07:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3A7A2C15D5C; Fri,  1 Jul 2022 12:07:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36B9AC15D58
 for <cluster-devel@redhat.com>; Fri,  1 Jul 2022 12:07:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F68F80029D
 for <cluster-devel@redhat.com>; Fri,  1 Jul 2022 12:07:15 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-xW3z2aRbN8CKXY6sKh8Gaw-1; Fri, 01 Jul 2022 08:07:14 -0400
X-MC-Unique: xW3z2aRbN8CKXY6sKh8Gaw-1
Received: by mail-qv1-f72.google.com with SMTP id
 ls8-20020a0562145f8800b0047078180732so2469976qvb.2
 for <cluster-devel@redhat.com>; Fri, 01 Jul 2022 05:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zXhzCgqTisWYCfLQ5y3NkLn493B5u6s+MotNFCqarsA=;
 b=0ouOqDWeGm6Lq76HZewxNxK5CjUh/kSJgQbJOJXtrf4V8SKrIymPpLB8ZUkPUMQ/cg
 dkf92ht+XmCyyxF1X2ZenwOI9J+NIwDBtqr2P+LQ3f58TDMf/VRo9UX5XZy89iR0hIjR
 B3lGkbU/2zD+qUBRZsVKBl0tZwTv04WQ/hMMGEF3TwMvL2TRJXjlSjf3sMGNmt+kPQNs
 cyRjEcceIbDZ/4rdis1ZnJmaF9vTtHk7Piz7XxSPQHVO9zHr3f+B7+mZKH9tql0ejkTl
 F0L4ZOqsM54fM9JTxA84zVwnXBgObrbY9lpapiBOvfbtRcyrolyfF9f+Y7+g3mf6qy9u
 n9CA==
X-Gm-Message-State: AJIora8fLj3H9/8cPsBIcNjMfh9hF6IvB4dYt/sDGR7ok2xzEckILBzm
 AgH9APnHNZXnxSOvNeJnNiiQRl7HvEjd7n6oIkpfWolXvef0wnm4D5ACKmCeEWD630LDHO5ht9a
 JZW7FKuJUEibkJLoDOmFAQ0jTqOonohsYjk4h7g==
X-Received: by 2002:ac8:5749:0:b0:305:1ea5:4a7 with SMTP id
 9-20020ac85749000000b003051ea504a7mr12090126qtx.291.1656677233489; 
 Fri, 01 Jul 2022 05:07:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vPEbyYUewayWbWLRAfTmQdi+voNzbdWmyNv7kpwUkdnn2VbxTjMzi9pHOfGl1Z0MPdfmMBqDhBInC3Hnk8Lhg=
X-Received: by 2002:ac8:5749:0:b0:305:1ea5:4a7 with SMTP id
 9-20020ac85749000000b003051ea504a7mr12090089qtx.291.1656677233207; Fri, 01
 Jul 2022 05:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220630135934.1799248-1-aahringo@redhat.com>
 <CAHk-=wjZfO9hGqJ2_hGQG3U_XzSh9_XaXze=HgPdvJbgrvASfA@mail.gmail.com>
In-Reply-To: <CAHk-=wjZfO9hGqJ2_hGQG3U_XzSh9_XaXze=HgPdvJbgrvASfA@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 1 Jul 2022 08:07:01 -0400
Message-ID: <CAK-6q+jkNbotWK7cFsNGO+B+ApcdUd7+_4mdcF8=00YsDAATTA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [RFC 0/2] refcount: attempt to avoid imbalance
 warnings
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 cluster-devel <cluster-devel@redhat.com>,
 Sparse Mailing-list <linux-sparse@vger.kernel.org>, thunder.leizhen@huawei.com,
 jacob.e.keller@intel.com, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Jun 30, 2022 at 12:34 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Jun 30, 2022 at 6:59 AM Alexander Aring <aahringo@redhat.com> wrote:
> >
> > I send this patch series as RFC because it was necessary to do a kref
> > change after adding __cond_lock() to refcount_dec_and_lock()
> > functionality.
>
> Can you try something like this instead?
>
> This is two separate patches - one for sparse, and one for the kernel.
>
> This is only *very* lightly tested (ie I tested it on a single kernel
> file that used refcount_dec_and_lock())
>

yes that avoids the warnings for fs/dlm.c by calling unlock() when the
kref_put_lock() returns true.

However there exists other users of kref_put_lock() which drops a
sparse warning now after those patches e.g.  net/sunrpc/svcauth.c.
I think I can explain why. It is that kref_put_lock() has a release
callback and it's _optional_ that this release callback calls the
unlock(). If the release callback calls unlock() then the user of
kref_put_lock() signals this with a releases() annotation of the
passed release callback.

It seems that sparse is not detecting this annotation anymore when
it's passed as callback and the function pointer parameter declaration
of kref_put_lock() does not have such annotation. The annotation gets
"dropped" then.

If I change the parameter order and add a annotation to the release
callback, like:

__kref_put_lock(struct kref *kref, spinlock_t *lock,
               void (*release)(struct kref *kref) __releases(lock))
#define kref_put_lock(kref, release, lock) __kref_put_lock(kref, lock, release)

the problem is gone but forces every user to release the lock in the
release callback which isn't required and also cuts the API because
the lock which you want to call unlock() on can be not part of your
container_of(kref) struct.

Then I did a similar thing before which would solve it for every user
because there is simply no function pointer passed as parameter and
the annotation gets never "dropped":

#define kref_put_lock(kref, release, lock) \
(refcount_dec_and_lock(&(kref)->refcount, lock) ? ({ release(kref); 1; }) : 0)

Maybe a functionality of forwarding function annotation if passed as a
function pointer (function pointer declared without annotations) as in
e.g. kref_put_lock() can be added into sparse?

- Alex

