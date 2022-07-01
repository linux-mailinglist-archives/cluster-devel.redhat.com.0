Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE40563991
	for <lists+cluster-devel@lfdr.de>; Fri,  1 Jul 2022 21:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656702556;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0fTpQgJi583J8jUAwjwOMbnhXpGFLL7LTfUdXvC5nug=;
	b=i8F0HAqr29wv2PYu18Cri/7YQsGNKdGP7tEJN39pBIOXGZAOTuOCnT/Rdv3oK9l43UND8U
	ten2rbSEtlwo8axPeB7ciIX41jI5hZ0ug2w8i23SBkUxPFVtmFUat00UySFJRFt01nYwrc
	niv/TJ6wR4yGh/CN4mMbbY2dbrWXklo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-eiiJp9XZP3qPBT7dLK7lWw-1; Fri, 01 Jul 2022 15:09:15 -0400
X-MC-Unique: eiiJp9XZP3qPBT7dLK7lWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0763881D9EC;
	Fri,  1 Jul 2022 19:09:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6161DC15D7E;
	Fri,  1 Jul 2022 19:09:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3FB6D194707A;
	Fri,  1 Jul 2022 19:09:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ADE4E1947058 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  1 Jul 2022 19:09:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C1FA1415308; Fri,  1 Jul 2022 19:09:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87E171415307
 for <cluster-devel@redhat.com>; Fri,  1 Jul 2022 19:09:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E7143C0D876
 for <cluster-devel@redhat.com>; Fri,  1 Jul 2022 19:09:13 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-8lY9gpMlN6m4qON8OgYPAw-1; Fri, 01 Jul 2022 15:09:12 -0400
X-MC-Unique: 8lY9gpMlN6m4qON8OgYPAw-1
Received: by mail-qv1-f72.google.com with SMTP id
 de15-20020ad4584f000000b00472d98d4a88so636461qvb.12
 for <cluster-devel@redhat.com>; Fri, 01 Jul 2022 12:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0fTpQgJi583J8jUAwjwOMbnhXpGFLL7LTfUdXvC5nug=;
 b=GGFIGtfHkGYbZpKtzqojIQxeS17+g4Wc282LUmUhXtvNJDtZsVzZS9oSKxJxmGph/4
 gvKy7MGhCx+L5Fuh8BxcKGE5E5g8m9EzgKUtpZMtHhgVCRWJrZ3vplJXMDVnx5QQVLgz
 Ka4wV/sk0zuMCI1fpx2tzSJWbg8sxIXFUcbrY78GyuIn9uq3IdreZGUVl3KMeaJ2UQ7H
 eip9OlxtdMI3Wu7mgh6tpTvYfkd8hJ1mIjmtnfwcir/bzsiczyF3NKJTu/72UX7I7XlI
 126rUDcETy5wi7maDGEttuDY70BO3Jw/drSneYR7EqVLkk/Ix1R5wwawKqroYAjoeUWT
 jIfg==
X-Gm-Message-State: AJIora/dPI+dLYrkRF8tvPPQBkobYeavjjhL9ya2pAB1DyJ3+YUDkpuT
 E7ftlqoGXD76EqkKz1o3sISjjBLsfXE6KwIAFWGgV2J0kMcavXGb/bB867e+bRu9s33HHZ972ub
 asTzMIZ94ztgUkTELChyzdZITzo/XjYHPMmg6Sg==
X-Received: by 2002:ac8:4e8b:0:b0:31d:34c6:86a2 with SMTP id
 11-20020ac84e8b000000b0031d34c686a2mr6376695qtp.526.1656702551834; 
 Fri, 01 Jul 2022 12:09:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vmSaEwZdRV22oe7QtV5IzenWy25OI2oIP1ZZYcQg8tltXD2qNQp+JMu8VFupmj1poaUi8ytsw36XaCQrSfliI=
X-Received: by 2002:ac8:4e8b:0:b0:31d:34c6:86a2 with SMTP id
 11-20020ac84e8b000000b0031d34c686a2mr6376668qtp.526.1656702551575; Fri, 01
 Jul 2022 12:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220630135934.1799248-1-aahringo@redhat.com>
 <CAHk-=wjZfO9hGqJ2_hGQG3U_XzSh9_XaXze=HgPdvJbgrvASfA@mail.gmail.com>
 <CAK-6q+jkNbotWK7cFsNGO+B+ApcdUd7+_4mdcF8=00YsDAATTA@mail.gmail.com>
In-Reply-To: <CAK-6q+jkNbotWK7cFsNGO+B+ApcdUd7+_4mdcF8=00YsDAATTA@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 1 Jul 2022 15:09:00 -0400
Message-ID: <CAK-6q+i67rNeioq+=MzLyCJ_fh7DvDVWOHA02oOasKocvkhXSw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Jul 1, 2022 at 8:07 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Thu, Jun 30, 2022 at 12:34 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Thu, Jun 30, 2022 at 6:59 AM Alexander Aring <aahringo@redhat.com> wrote:
> > >
> > > I send this patch series as RFC because it was necessary to do a kref
> > > change after adding __cond_lock() to refcount_dec_and_lock()
> > > functionality.
> >
> > Can you try something like this instead?
> >
> > This is two separate patches - one for sparse, and one for the kernel.
> >
> > This is only *very* lightly tested (ie I tested it on a single kernel
> > file that used refcount_dec_and_lock())
> >
>
> yes that avoids the warnings for fs/dlm.c by calling unlock() when the
> kref_put_lock() returns true.
>
> However there exists other users of kref_put_lock() which drops a
> sparse warning now after those patches e.g.  net/sunrpc/svcauth.c.
> I think I can explain why. It is that kref_put_lock() has a release
> callback and it's _optional_ that this release callback calls the
> unlock(). If the release callback calls unlock() then the user of
> kref_put_lock() signals this with a releases() annotation of the
> passed release callback.
>
> It seems that sparse is not detecting this annotation anymore when
> it's passed as callback and the function pointer parameter declaration
> of kref_put_lock() does not have such annotation. The annotation gets
> "dropped" then.
>
> If I change the parameter order and add a annotation to the release
> callback, like:
>
> __kref_put_lock(struct kref *kref, spinlock_t *lock,
>                void (*release)(struct kref *kref) __releases(lock))
> #define kref_put_lock(kref, release, lock) __kref_put_lock(kref, lock, release)
>
> the problem is gone but forces every user to release the lock in the
> release callback which isn't required and also cuts the API because
> the lock which you want to call unlock() on can be not part of your
> container_of(kref) struct.
>
> Then I did a similar thing before which would solve it for every user
> because there is simply no function pointer passed as parameter and
> the annotation gets never "dropped":
>
> #define kref_put_lock(kref, release, lock) \
> (refcount_dec_and_lock(&(kref)->refcount, lock) ? ({ release(kref); 1; }) : 0)
>
> Maybe a functionality of forwarding function annotation if passed as a
> function pointer (function pointer declared without annotations) as in
> e.g. kref_put_lock() can be added into sparse?

I think the explanation above is not quite right. I am questioning
myself now why it was working before... and I guess the answer is that
it was working for kref_put_lock() with the callback __releases()
handling. It has somehow now an additional acquire() because the
__cond_acquires() change.

Before the patch:

no warnings:

void foo_release(struct kref *kref)
__releases(&foo_lock)
{
        ...
        unlock(foo_lock);
}

...
kref_put_lock(&foo->kref, foo_release, &foo_lock);

shows context imbalance warnings:

void foo_release(struct kref *kref) { }

if (kref_put_lock(&foo->kref, foo_release, &foo_lock))
        unlock(foo_lock);

After the patch it's vice versa of showing warnings or not about
context imbalances.

- Alex

